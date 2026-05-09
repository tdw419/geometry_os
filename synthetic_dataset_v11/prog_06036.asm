; DESCRIPTION: Renders a blue line between points (194, 109) and (120, 12).
; PLAN: r0=194(x1), r1=109(y1), r2=120(x2), r3=12(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 109
LDI r2, 120
LDI r3, 12
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
