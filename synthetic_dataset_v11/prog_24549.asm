; DESCRIPTION: Renders a magenta line between points (216, 72) and (184, 43).
; PLAN: r0=216(x1), r1=72(y1), r2=184(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 72
LDI r2, 184
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
