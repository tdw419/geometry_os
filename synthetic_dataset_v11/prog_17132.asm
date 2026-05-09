; DESCRIPTION: Places a magenta line segment connecting (230, 165) to (10, 211).
; PLAN: r0=230(x1), r1=165(y1), r2=10(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 165
LDI r2, 10
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
