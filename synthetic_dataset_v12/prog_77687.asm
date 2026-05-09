; DESCRIPTION: Places a magenta line segment connecting (128, 4) to (35, 144).
; PLAN: r0=128(x1), r1=4(y1), r2=35(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 4
LDI r2, 35
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
