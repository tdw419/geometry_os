; DESCRIPTION: Draws a orange line from (49, 84) to (124, 21).
; PLAN: r0=49(x1), r1=84(y1), r2=124(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 84
LDI r2, 124
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
