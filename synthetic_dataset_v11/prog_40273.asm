; DESCRIPTION: Renders a purple line between points (86, 192) and (160, 154).
; PLAN: r0=86(x1), r1=192(y1), r2=160(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 192
LDI r2, 160
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
