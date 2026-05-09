; DESCRIPTION: Renders a magenta line between points (155, 108) and (5, 1).
; PLAN: r0=155(x1), r1=108(y1), r2=5(x2), r3=1(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 108
LDI r2, 5
LDI r3, 1
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
