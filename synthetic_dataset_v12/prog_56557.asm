; DESCRIPTION: Places a blue line segment connecting (32, 217) to (224, 35).
; PLAN: r0=32(x1), r1=217(y1), r2=224(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 217
LDI r2, 224
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
