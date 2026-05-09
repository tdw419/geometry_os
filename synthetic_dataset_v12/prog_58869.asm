; DESCRIPTION: Renders a blue line between points (477, 26) and (117, 93).
; PLAN: r0=477(x1), r1=26(y1), r2=117(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 26
LDI r2, 117
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
