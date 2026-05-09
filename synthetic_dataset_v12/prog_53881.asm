; DESCRIPTION: Places a magenta line segment connecting (195, 91) to (56, 128).
; PLAN: r0=195(x1), r1=91(y1), r2=56(x2), r3=128(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 91
LDI r2, 56
LDI r3, 128
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
