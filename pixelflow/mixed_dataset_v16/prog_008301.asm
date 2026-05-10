; DESCRIPTION: Renders a magenta line segment connecting (270, 85) to (94, 105).
; PLAN: r0=270(x1), r1=85(y1), r2=94(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 85
LDI r2, 94
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
