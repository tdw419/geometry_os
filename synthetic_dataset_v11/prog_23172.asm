; DESCRIPTION: Places a blue line segment connecting (148, 30) to (224, 8).
; PLAN: r0=148(x1), r1=30(y1), r2=224(x2), r3=8(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 30
LDI r2, 224
LDI r3, 8
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
