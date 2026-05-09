; DESCRIPTION: Places a magenta line segment connecting (80, 64) to (32, 232).
; PLAN: r0=80(x1), r1=64(y1), r2=32(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 64
LDI r2, 32
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
