; DESCRIPTION: Places a blue line segment connecting (224, 86) to (168, 97).
; PLAN: r0=224(x1), r1=86(y1), r2=168(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 86
LDI r2, 168
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
