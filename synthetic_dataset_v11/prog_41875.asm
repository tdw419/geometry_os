; DESCRIPTION: Places a magenta line segment connecting (222, 232) to (128, 144).
; PLAN: r0=222(x1), r1=232(y1), r2=128(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 232
LDI r2, 128
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
