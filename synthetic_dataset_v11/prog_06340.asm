; DESCRIPTION: Places a magenta line segment connecting (25, 2) to (134, 211).
; PLAN: r0=25(x1), r1=2(y1), r2=134(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 2
LDI r2, 134
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
