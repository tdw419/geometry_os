; DESCRIPTION: Renders a blue line between points (21, 26) and (93, 141).
; PLAN: r0=21(x1), r1=26(y1), r2=93(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 26
LDI r2, 93
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
