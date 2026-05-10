; DESCRIPTION: Renders a purple line segment connecting (46, 186) to (356, 144).
; PLAN: r0=46(x1), r1=186(y1), r2=356(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 186
LDI r2, 356
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
