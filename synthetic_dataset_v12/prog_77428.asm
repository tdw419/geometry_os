; DESCRIPTION: Renders a magenta line between points (35, 68) and (478, 217).
; PLAN: r0=35(x1), r1=68(y1), r2=478(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 68
LDI r2, 478
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
