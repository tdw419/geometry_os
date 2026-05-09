; DESCRIPTION: Renders a magenta line between points (155, 162) and (74, 208).
; PLAN: r0=155(x1), r1=162(y1), r2=74(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 162
LDI r2, 74
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
