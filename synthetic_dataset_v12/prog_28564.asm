; DESCRIPTION: Places a magenta line segment connecting (132, 32) to (314, 155).
; PLAN: r0=132(x1), r1=32(y1), r2=314(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 32
LDI r2, 314
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
