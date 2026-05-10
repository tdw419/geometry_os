; DESCRIPTION: Renders a purple line between points (205, 112) and (122, 37).
; PLAN: r0=205(x1), r1=112(y1), r2=122(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 112
LDI r2, 122
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
