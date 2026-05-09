; DESCRIPTION: Places a yellow line segment connecting (224, 58) to (122, 227).
; PLAN: r0=224(x1), r1=58(y1), r2=122(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 58
LDI r2, 122
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
