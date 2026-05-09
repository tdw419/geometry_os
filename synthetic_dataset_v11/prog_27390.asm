; DESCRIPTION: Places a green line segment connecting (224, 219) to (142, 22).
; PLAN: r0=224(x1), r1=219(y1), r2=142(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 219
LDI r2, 142
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
