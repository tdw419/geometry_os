; DESCRIPTION: Places a purple line segment connecting (112, 186) to (269, 88).
; PLAN: r0=112(x1), r1=186(y1), r2=269(x2), r3=88(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 186
LDI r2, 269
LDI r3, 88
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
