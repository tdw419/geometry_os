; DESCRIPTION: Draws a orange line from (261, 136) to (313, 2).
; PLAN: r0=261(x1), r1=136(y1), r2=313(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 136
LDI r2, 313
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
