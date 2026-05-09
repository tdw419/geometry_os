; DESCRIPTION: Renders a blue line between points (93, 96) and (179, 84).
; PLAN: r0=93(x1), r1=96(y1), r2=179(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 96
LDI r2, 179
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
