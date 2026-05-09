; DESCRIPTION: Draws a orange line from (274, 160) to (157, 88).
; PLAN: r0=274(x1), r1=160(y1), r2=157(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 160
LDI r2, 157
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
