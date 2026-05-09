; DESCRIPTION: Places a magenta line segment connecting (150, 75) to (181, 222).
; PLAN: r0=150(x1), r1=75(y1), r2=181(x2), r3=222(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 75
LDI r2, 181
LDI r3, 222
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
