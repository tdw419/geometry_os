; DESCRIPTION: Renders a purple line between points (73, 73) and (216, 224).
; PLAN: r0=73(x1), r1=73(y1), r2=216(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 73
LDI r2, 216
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
