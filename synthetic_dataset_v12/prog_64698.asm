; DESCRIPTION: Renders a blue line between points (109, 242) and (93, 230).
; PLAN: r0=109(x1), r1=242(y1), r2=93(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 242
LDI r2, 93
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
