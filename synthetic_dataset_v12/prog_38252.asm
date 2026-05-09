; DESCRIPTION: Draws a orange line from (341, 94) to (453, 73).
; PLAN: r0=341(x1), r1=94(y1), r2=453(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 94
LDI r2, 453
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
