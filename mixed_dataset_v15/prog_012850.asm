; DESCRIPTION: Renders a purple line between points (353, 242) and (144, 138).
; PLAN: r0=353(x1), r1=242(y1), r2=144(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 242
LDI r2, 144
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
