; DESCRIPTION: Places a magenta line segment connecting (173, 23) to (190, 224).
; PLAN: r0=173(x1), r1=23(y1), r2=190(x2), r3=224(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 23
LDI r2, 190
LDI r3, 224
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
