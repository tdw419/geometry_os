; DESCRIPTION: Renders a magenta line segment connecting (365, 81) to (204, 106).
; PLAN: r0=365(x1), r1=81(y1), r2=204(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 81
LDI r2, 204
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
