; DESCRIPTION: Draws a purple line from (341, 1) to (442, 145).
; PLAN: r0=341(x1), r1=1(y1), r2=442(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 1
LDI r2, 442
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
