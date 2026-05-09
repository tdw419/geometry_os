; DESCRIPTION: Places a magenta line segment connecting (80, 175) to (128, 189).
; PLAN: r0=80(x1), r1=175(y1), r2=128(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 175
LDI r2, 128
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
