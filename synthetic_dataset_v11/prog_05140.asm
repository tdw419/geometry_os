; DESCRIPTION: Renders a magenta line between points (158, 88) and (162, 238).
; PLAN: r0=158(x1), r1=88(y1), r2=162(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 88
LDI r2, 162
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
