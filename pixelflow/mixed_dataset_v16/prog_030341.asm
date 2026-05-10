; DESCRIPTION: Renders a purple line between points (98, 177) and (203, 88).
; PLAN: r0=98(x1), r1=177(y1), r2=203(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 177
LDI r2, 203
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
