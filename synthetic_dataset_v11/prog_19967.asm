; DESCRIPTION: Places a magenta line segment connecting (133, 21) to (144, 11).
; PLAN: r0=133(x1), r1=21(y1), r2=144(x2), r3=11(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 21
LDI r2, 144
LDI r3, 11
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
