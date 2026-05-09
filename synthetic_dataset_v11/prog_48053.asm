; DESCRIPTION: Places a green line segment connecting (62, 101) to (175, 224).
; PLAN: r0=62(x1), r1=101(y1), r2=175(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 101
LDI r2, 175
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
