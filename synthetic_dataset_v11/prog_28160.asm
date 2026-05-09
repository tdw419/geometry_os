; DESCRIPTION: Renders a magenta line between points (184, 7) and (216, 230).
; PLAN: r0=184(x1), r1=7(y1), r2=216(x2), r3=230(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 7
LDI r2, 216
LDI r3, 230
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
