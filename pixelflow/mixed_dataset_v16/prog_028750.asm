; DESCRIPTION: Places a magenta line segment connecting (192, 63) to (90, 22).
; PLAN: r0=192(x1), r1=63(y1), r2=90(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 63
LDI r2, 90
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
