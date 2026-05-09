; DESCRIPTION: Places a magenta line segment connecting (128, 156) to (150, 68).
; PLAN: r0=128(x1), r1=156(y1), r2=150(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 156
LDI r2, 150
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
