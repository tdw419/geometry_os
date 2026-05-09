; DESCRIPTION: Draws a orange line from (6, 23) to (124, 135).
; PLAN: r0=6(x1), r1=23(y1), r2=124(x2), r3=135(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 23
LDI r2, 124
LDI r3, 135
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
