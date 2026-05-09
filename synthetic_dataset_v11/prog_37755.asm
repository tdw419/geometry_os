; DESCRIPTION: Places a black line segment connecting (237, 80) to (68, 224).
; PLAN: r0=237(x1), r1=80(y1), r2=68(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 80
LDI r2, 68
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
