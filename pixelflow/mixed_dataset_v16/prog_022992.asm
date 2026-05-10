; DESCRIPTION: Places a orange line segment connecting (168, 22) to (119, 224).
; PLAN: r0=168(x1), r1=22(y1), r2=119(x2), r3=224(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 22
LDI r2, 119
LDI r3, 224
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
