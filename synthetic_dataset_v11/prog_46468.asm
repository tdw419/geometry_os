; DESCRIPTION: Places a purple line segment connecting (156, 154) to (224, 222).
; PLAN: r0=156(x1), r1=154(y1), r2=224(x2), r3=222(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 154
LDI r2, 224
LDI r3, 222
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
