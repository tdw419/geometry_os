; DESCRIPTION: Places a blue line segment connecting (224, 56) to (317, 242).
; PLAN: r0=224(x1), r1=56(y1), r2=317(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 56
LDI r2, 317
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
