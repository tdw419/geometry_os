; DESCRIPTION: Renders a magenta line segment connecting (389, 20) to (345, 24).
; PLAN: r0=389(x1), r1=20(y1), r2=345(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 20
LDI r2, 345
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
