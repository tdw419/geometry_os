; DESCRIPTION: Renders a magenta line between points (184, 65) and (353, 141).
; PLAN: r0=184(x1), r1=65(y1), r2=353(x2), r3=141(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 65
LDI r2, 353
LDI r3, 141
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
