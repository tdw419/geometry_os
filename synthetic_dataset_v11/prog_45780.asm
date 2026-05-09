; DESCRIPTION: Renders a magenta line between points (105, 85) and (190, 252).
; PLAN: r0=105(x1), r1=85(y1), r2=190(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 85
LDI r2, 190
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
