; DESCRIPTION: Renders a purple line between points (364, 152) and (260, 205).
; PLAN: r0=364(x1), r1=152(y1), r2=260(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 152
LDI r2, 260
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
