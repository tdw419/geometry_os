; DESCRIPTION: Places a black line segment connecting (57, 224) to (201, 88).
; PLAN: r0=57(x1), r1=224(y1), r2=201(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 224
LDI r2, 201
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
