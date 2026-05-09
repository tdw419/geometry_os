; DESCRIPTION: Renders a magenta line between points (200, 75) and (237, 252).
; PLAN: r0=200(x1), r1=75(y1), r2=237(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 75
LDI r2, 237
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
