; DESCRIPTION: Places a magenta line segment connecting (129, 150) to (181, 230).
; PLAN: r0=129(x1), r1=150(y1), r2=181(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 150
LDI r2, 181
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
