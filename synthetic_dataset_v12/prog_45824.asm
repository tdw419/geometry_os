; DESCRIPTION: Renders a magenta line between points (230, 0) and (423, 106).
; PLAN: r0=230(x1), r1=0(y1), r2=423(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 0
LDI r2, 423
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
