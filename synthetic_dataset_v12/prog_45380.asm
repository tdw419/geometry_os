; DESCRIPTION: Places a magenta line segment connecting (14, 103) to (132, 89).
; PLAN: r0=14(x1), r1=103(y1), r2=132(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 103
LDI r2, 132
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
