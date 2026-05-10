; DESCRIPTION: Draws a purple line from (274, 137) to (178, 192).
; PLAN: r0=274(x1), r1=137(y1), r2=178(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 137
LDI r2, 178
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
