; DESCRIPTION: Places a magenta line segment connecting (78, 159) to (8, 222).
; PLAN: r0=78(x1), r1=159(y1), r2=8(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 159
LDI r2, 8
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
