; DESCRIPTION: Draws a orange line from (341, 155) to (191, 45).
; PLAN: r0=341(x1), r1=155(y1), r2=191(x2), r3=45(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 155
LDI r2, 191
LDI r3, 45
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
