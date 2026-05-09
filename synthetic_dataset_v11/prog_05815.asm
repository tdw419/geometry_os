; DESCRIPTION: Renders a purple line between points (86, 162) and (139, 192).
; PLAN: r0=86(x1), r1=162(y1), r2=139(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 162
LDI r2, 139
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
