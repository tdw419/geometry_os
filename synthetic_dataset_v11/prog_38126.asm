; DESCRIPTION: Renders a magenta line between points (93, 112) and (86, 206).
; PLAN: r0=93(x1), r1=112(y1), r2=86(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 112
LDI r2, 86
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
