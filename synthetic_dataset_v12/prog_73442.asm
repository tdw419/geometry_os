; DESCRIPTION: Renders a magenta line between points (68, 18) and (136, 30).
; PLAN: r0=68(x1), r1=18(y1), r2=136(x2), r3=30(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 18
LDI r2, 136
LDI r3, 30
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
