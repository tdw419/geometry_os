; DESCRIPTION: Places a green line segment connecting (254, 170) to (245, 224).
; PLAN: r0=254(x1), r1=170(y1), r2=245(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 170
LDI r2, 245
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
