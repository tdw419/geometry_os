; DESCRIPTION: Places a green line segment connecting (141, 13) to (224, 137).
; PLAN: r0=141(x1), r1=13(y1), r2=224(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 13
LDI r2, 224
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
