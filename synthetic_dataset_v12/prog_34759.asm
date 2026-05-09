; DESCRIPTION: Places a green line segment connecting (470, 86) to (141, 224).
; PLAN: r0=470(x1), r1=86(y1), r2=141(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 86
LDI r2, 141
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
