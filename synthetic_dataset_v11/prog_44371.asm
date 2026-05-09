; DESCRIPTION: Draws a purple line from (192, 130) to (105, 80).
; PLAN: r0=192(x1), r1=130(y1), r2=105(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 130
LDI r2, 105
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
