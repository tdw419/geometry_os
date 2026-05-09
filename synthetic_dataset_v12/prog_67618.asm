; DESCRIPTION: Places a green line segment connecting (78, 123) to (161, 224).
; PLAN: r0=78(x1), r1=123(y1), r2=161(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 123
LDI r2, 161
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
