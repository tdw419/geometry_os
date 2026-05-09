; DESCRIPTION: Renders a purple line between points (192, 99) and (48, 24).
; PLAN: r0=192(x1), r1=99(y1), r2=48(x2), r3=24(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 99
LDI r2, 48
LDI r3, 24
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
