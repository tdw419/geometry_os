; DESCRIPTION: Places a magenta line segment connecting (224, 61) to (13, 188).
; PLAN: r0=224(x1), r1=61(y1), r2=13(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 61
LDI r2, 13
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
