; DESCRIPTION: Renders a magenta line between points (190, 148) and (200, 89).
; PLAN: r0=190(x1), r1=148(y1), r2=200(x2), r3=89(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 148
LDI r2, 200
LDI r3, 89
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
