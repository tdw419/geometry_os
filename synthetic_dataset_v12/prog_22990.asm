; DESCRIPTION: Places a black line segment connecting (417, 26) to (253, 224).
; PLAN: r0=417(x1), r1=26(y1), r2=253(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 26
LDI r2, 253
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
