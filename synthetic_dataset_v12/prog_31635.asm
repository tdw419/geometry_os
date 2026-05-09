; DESCRIPTION: Renders a purple line between points (213, 218) and (222, 22).
; PLAN: r0=213(x1), r1=218(y1), r2=222(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 218
LDI r2, 222
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
