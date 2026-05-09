; DESCRIPTION: Draws a purple line from (18, 76) to (136, 20).
; PLAN: r0=18(x1), r1=76(y1), r2=136(x2), r3=20(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 76
LDI r2, 136
LDI r3, 20
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
