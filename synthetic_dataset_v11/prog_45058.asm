; DESCRIPTION: Draws a orange line from (194, 86) to (20, 238).
; PLAN: r0=194(x1), r1=86(y1), r2=20(x2), r3=238(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 86
LDI r2, 20
LDI r3, 238
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
