; DESCRIPTION: Places a magenta line segment connecting (134, 211) to (61, 4).
; PLAN: r0=134(x1), r1=211(y1), r2=61(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 211
LDI r2, 61
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
