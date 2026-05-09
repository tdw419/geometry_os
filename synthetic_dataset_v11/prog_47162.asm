; DESCRIPTION: Renders a blue line between points (115, 163) and (81, 212).
; PLAN: r0=115(x1), r1=163(y1), r2=81(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 163
LDI r2, 81
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
