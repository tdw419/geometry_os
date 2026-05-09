; DESCRIPTION: Draws a orange line from (430, 14) to (151, 238).
; PLAN: r0=430(x1), r1=14(y1), r2=151(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 14
LDI r2, 151
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
