; DESCRIPTION: Places a magenta line segment connecting (100, 65) to (364, 204).
; PLAN: r0=100(x1), r1=65(y1), r2=364(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 65
LDI r2, 364
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
