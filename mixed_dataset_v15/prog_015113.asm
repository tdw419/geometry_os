; DESCRIPTION: Renders a blue line between points (61, 33) and (93, 179).
; PLAN: r0=61(x1), r1=33(y1), r2=93(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 33
LDI r2, 93
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
