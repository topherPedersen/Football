05 CLS
10 PRINT "FTBALL"
15 PRINT "CREATIVE COMPUTING"
20 PRINT "MORRISTOWN, NEW JERSEY"
21 PRINT
22 PRINT "PRESS <ENTER> TO PLAY"
23 INPUT PE$
24 CLS
100 REM T "1234567890123456789012345678901"
220 PRINT "THIS IS DARTMOUTH CHAMPIONSHIP"
221 PRINT "FOOTBALL. YOU WILL QUARTERBACK"
230 PRINT "DARTMOUTH. CALL PLAYS AS"
235 PRINT "FOLLOWS:"
236 PRINT
240 PRINT "  1= SIMPLE RUN"
241 PRINT "  2= TRICKY RUN"
242 PRINT "  3= SHORT PASS"
250 PRINT "  4= LONG PASS"
251 PRINT "  5= PUNT"
252 PRINT "  6= QUICK KICK"
253 PRINT "  7= PLACE KICK"
260 PRINT
270 PRINT "CHOOSE YOUR OPPONENT";
275 DIM O$(1)
280 INPUT O$(1)
290 O$(0)="DARTMOUTH"
300 PRINT
305 DIM S(1)
310 S(0)=0: S(1)=0
320 REM
330 DIM L$(20)
340 FOR I=1 TO 20: READ L$(I): NEXT I
350 DATA "KICK","RECEIVE"," YARD ","RUN BACK FOR ","BALL ON "
360 DATA "YARD LINE"," SIMPLE RUN"," TRICKY RUN"," SHORT PASS"
370 DATA " LONG PASS","PUNT"," QUICK KICK "," PLACE KICK"," LOSS "
380 DATA " NO GAIN","GAIN "," TOUCHDOWN "," TOUCHBACK ","SAFETY***"
385 DATA "JUNK"
390 P=INT(RND(0)*2)
395 REM T "1234567890123456789012345678901"
400 PRINT O$(P);" WON THE TOSS"
430 IF P=0 THEN 470
440 PRINT O$(1);" ELECTS TO RECEIVE."
450 PRINT
460 GOTO 580
470 PRINT "DO YOU ELECT TO KICK OR RECEIVE";
480 INPUT A$
490 PRINT
500 FOR E=1 TO 2
510 IF A$=L$(E) THEN 550
520 NEXT E
525 REM T "1234567890123456789012345678901"
530 PRINT "INCORRECT ANSWER. PLEASE TYPE"
535 PRINT "'KICK' OR 'RECEIVE'";
540 GOTO 480
550 IF E=2 THEN 580
560 P=1
580 X=40+(1-P)*20
590 Q1=RND(0)-.5
595 Y=INT(200*(Q1*Q1*Q1)+55)
600 PRINT Y;L$(3);" KICKOFF"
610 X=X-(1-2*P)*Y
620 IF ABS(X-50)>=50 THEN 700
630 Q2=RND(0)
632 Q3=RND(0)
635 Y=INT(50*(Q2*Q2))+(1-P)*INT(50*(Q3*Q3*Q3*Q3))
640 X=X+(1-2*P)*Y
650 IF ABS(X-50)>=50 THEN 655
651 PRINT Y;L$(3);" RUNBACK"
652 GOTO 720
655 PRINT L$(4);
660 GOTO 2600
700 PRINT "TOUCHBACK FOR ";O$(P);"."
710 X=20+P*60
720 REM FIRST DOWN
730 GOSUB 800
740 X1=X
750 D=1
760 PRINT:PRINT "FIRST DOWN ";O$(P);"***"
770 PRINT
780 PRINT
790 GOTO 860
800 REM PRINT POSITION
810 IF X>50 THEN 840
820 PRINT L$(5);O$(0);X;L$(6)
830 GOTO 850
840 PRINT L$(5);O$(1);100-X;L$(6)
850 RETURN
860 REM NEW PLAY
870 T=T+1
880 IF T=30 THEN 1060
890 IF T<50 THEN 940
900 IF RND(0)>.2 THEN 940
910 PRINT "END OF GAME  ***"
920 PRINT "FINAL SCORE:  ";O$(0);": ";S(0);"  ";O$(1);": ";S(1)
930 STOP
940 IF P=1 THEN 1870
950 PRINT "NEXT PLAY";
960 INPUT Z
970 IF Z<>INT(Z) THEN 990
980 IF ABS(Z-4)<=3 THEN 1010
990 PRINT "ILLEGAL PLAY NUMBER, RETYPE";
1000 GOTO 960
1010 F=0
1020 PRINT L$(Z+6);".  ";
1030 R=RND(0)*(.98+(1-2*P)*.02)
1040 R1=RND(0)
1050 ON Z GOTO 1110,1150,1260,1480,1570,1570,1680
1060 REM  JEAN'S SPECIAL
1070 IF RND(0)> 1/3 THEN 940
1080 PRINT "GAME DELAYED.  DOG ON FIELD."
1090 PRINT
1100 GOTO 940
1110 REM  SIMPLE RUN
1115 Q4=R-.5
1120 Y=INT(24*(Q4*Q4*Q4)+3)
1130 IF RND(0)<.05 THEN 1180
1140 GOTO 2190
1150 REM  TRICKY RUN
1160 Y=INT(20*R-5)
1170 IF RND(0)>.1 THEN 2190
1180 F=-1
1190 X3=X
1200 X=X+(1-2*P)*Y
1210 IF ABS(X-50)>=50 THEN 1240
1220 PRINT "***  FUMBLE AFTER ";
1230 GOTO 2230
1240 PRINT "***  FUMBLE."
1250 GOTO 2450
1260 REM  SHORT PASS
1265 Q5=R1-.5
1270 Y=INT(60*(Q5*Q5*Q5)+10)
1280 IF R<.05 THEN 1330
1290 IF R<.15 THEN 1390
1300 IF R<.55 THEN 1420
1310 PRINT "COMPLETE.  ";
1320 GOTO 2190
1330 IF D=4 THEN 1420
1340 PRINT "INTERCEPTED."
1350 F=-1
1360 X=X+(1-2*P)*Y
1370 IF ABS(X-50)>=50 THEN 2450
1380 GOTO 2300
1390 PRINT "PASSER TACKLED.  ";
1400 Y=-INT(10*R1)
1410 GOTO 2190
1420 Y=0
1430 IF RND(0)<.3 THEN 1460
1440 PRINT "INCOMPLETE.  ";
1450 GOTO 2190
1460 PRINT "BATTED DOWN.  ";
1470 GOTO 2190
1480 REM  LONG PASS
1485 Q6=R1-.5
1490 Y=INT(160*(Q6*Q6*Q6)+30)
1500 IF R<.1 THEN 1330
1510 IF R<.3 THEN 1540
1520 IF R<.75 THEN 1420
1530 GOTO 1310
1540 PRINT "PASSER TACKLED.  ";
1550 Y=-INT(15*R1+3)
1560 GOTO 2190
1570 REM  PUNT OR KICK
1575 Q7=R-.5
1580 Y=INT(100*(Q7*Q7*Q7)+35)
1590 IF D=4 THEN 1610
1600 Y=INT(Y*1.3)
1610 PRINT Y;L$(3);" PUNT"
1620 IF ABS(X+Y*(1-2*P)-50)>=50 THEN 1670
1630 IF D<4 THEN 1670
1640 Y1=INT((R1*R1)*20)
1650 PRINT Y1;L$(3);" RUN BACK"
1660 Y=Y-Y1
1670 GOTO 1350
1680 REM  PLACE KICK
1685 Q8=R-.5
1690 Y=INT(100*(Q8*Q8*Q8)+35)
1700 IF R1>.15 THEN 1740
1710 PRINT "KICK IS BLOCKED  ***"
1720 X=X-5*(1-2*P)
1730 P=1-P
1740 GOTO 720
1750 X=X+(1-2*P)*Y
1760 IF ABS(X-50)>=60 THEN 1810
1770 PRINT "KICK IS SHORT."
1780 IF ABS(X-50)>=50 THEN 2710
1790 P=1-P
1800 GOTO 630
1810 IF R1>.5 THEN 1840
1820 PRINT "KICK IS OFF TO THE SIDE."
1830 GOTO 2710
1840 PRINT "FIELD GOAL ***"
1850 S(P)=S(P)+3
1860 GOTO 2640
1870 REM  OPPONENT'S PLAY
1880 IF D>1 THEN 1940
1890 IF RND(0)>1/3 THEN 1920
1900 Z=3
1910 GOTO 1010
1920 Z=1
1930 GOTO 1010
1940 IF D=4 THEN 2090
1950 IF 10+X-X1<5 THEN 1890
1960 IF X<5 THEN 1890
1970 IF X<=10 THEN 2160
1980 IF X>X1 THEN 2020
1990 A=INT(2*RND(0))
2000 Z=2+A*2
2010 GOTO 1010
2020 IF D<3 THEN 1990
2030 IF X<45 THEN 1990
2040 IF RND(0)>1/4 THEN 2070
2050 Z=6
2060 GOTO 1010
2070 Z=4
2080 GOTO 1010
2090 IF X>30 THEN 2140
2100 IF 10+X-X1<3 THEN 1890
2110 IF X<3 THEN 1890
2120 Z=7
2130 GOTO 1010
2140 Z=5
2150 GOTO 1010
2160 A=INT(2*RND(0))
2170 Z=2+A
2180 GOTO 1010
2190 REM GAIN OR LOSS
2200 X3=X
2210 X=X+(1-2*P)*Y
2220 IF ABS(X-50)>=50 THEN 2450
2230 IF Y=0 THEN 2250
2240 PRINT ABS(Y);L$(3);
2250 PRINT L$(15+SGN(Y))
2280 IF ABS(X3-50)>40 THEN 2300
2290 IF RND(0)<.1 THEN 2860
2300 GOSUB 800
2310 IF F=0 THEN 2340
2320 P=1-P
2330 GOTO 740
2340 IF (P*(X1-X)+(1-P)*(X-X1))>=10 THEN 740
2350 IF D=4 THEN 2320
2360 D=D+1
2370 PRINT "DOWN: ";D;"     ";
2380 IF (X1-50)*(1-2*P)<40 THEN 2410
2390 PRINT "GOAL TO GO"
2400 GOTO 2420
2410 PRINT "YARDS TO GO: ";10-(P*(X1-X)+(1-P)*(X-X1))
2420 PRINT
2430 PRINT
2440 GOTO 860
2450 REM BALL IN END-ZONE
2460 IF X>=100 THEN 2490
2470 E=0
2480 GOTO 2500
2490 E=1
2500 ON 1+E-F*2+P*4 GOTO 2510,2590,2760,2710,2590,2510,2710,2760
2510 REM SAFETY
2520 S(1-P)=S(1-P)+2
2530 PRINT L$(19)
2540 GOSUB 2800
2550 PRINT O$(P);" KICKS OFF FROM ITS 20 YARD LINE."
2560 X=20+P*60
2570 P=1-P
2580 GOTO 590
2590 REM OFFENSIVE TD
2600 PRINT L$(17);"***"
2610 IF RND(0)>.8 THEN 2680
2620 S(P)=S(P)+7
2630 PRINT "KICK IS GOOD."
2640 GOSUB 2800
2650 PRINT O$(P);" KICKS OFF"
2660 P=1-P
2670 GOTO 580
2680 PRINT "KICK IS OFF TO THE SIDE"
2690 S(P)=S(P)+6
2700 GOTO 2640
2710 REM TOUCHBACK
2720 PRINT L$(18)
2730 P=1-P
2740 X=20+P*60
2750 GOTO 720
2760 REM DEFENSIVE TD
2770 PRINT L$(17);"FOR ";O$(1-P);"***"
2780 P=1-P
2790 GOTO 2600
2800 REM SCORE
2810 PRINT
2820 PRINT "SCORE:  ";S(0);" TO ";S(1)
2830 PRINT
2840 PRINT
2850 RETURN
2860 REM PENALTY
2870 P3=INT(2*RND(0))
2880 PRINT O$(P3);" OFFSIDES -- PENALTY OF 5 YARDS."
2890 PRINT
2900 PRINT
2910 IF P3=0 THEN 2980
2920 PRINT "DO YOU ACCEPT THE PENALTY";
2930 INPUT A$
2940 IF A$="NO" THEN 2300
2950 IF A$="YES" THEN 3110
2960 PRINT "TYPE 'YES' OR 'NO'";
2970 GOTO 2930
2980 REM OPPONENT'S STRATEGY ON PENALTY
2990 IF P=1 THEN 3040
3000 IF Y<=0 THEN 3080
3010 IF F<0 THEN 3080
3020 IF (P*(X1-X)+(1-P)*(X-X1))<3*D-2 THEN 3080
3030 GOTO 3100
3040 IF Y<=5 THEN 3100
3050 IF F<0 THEN 3100
3060 IF D<4 THEN 3080
3070 IF (P*(X1-X)+(1-P)*(X-X1))<10 THEN 3100
3080 PRINT "PENALTY REFUSED."
3090 GOTO 2300
3100 PRINT "PENALTY ACCEPTED."
3110 F=0
3120 D=D-1
3130 IF P<>P3 THEN 3160
3140 X=X3-(1-2*P)*5
3150 GOTO 2300
3160 X=X3+(1-2*P)*5
3170 GOTO 2300
3180 END
