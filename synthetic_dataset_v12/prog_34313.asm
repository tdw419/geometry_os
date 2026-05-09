; DESCRIPTION: Places a yellow line segment connecting (302, 87) to (219, 224).
; PLAN: r0=302(x1), r1=87(y1), r2=219(x2), r3=224(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 87
LDI r2, 219
LDI r3, 224
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
