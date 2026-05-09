; DESCRIPTION: Places a blue line segment connecting (35, 80) to (224, 2).
; PLAN: r0=35(x1), r1=80(y1), r2=224(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 80
LDI r2, 224
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
