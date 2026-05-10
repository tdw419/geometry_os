; DESCRIPTION: Renders a black line between points (101, 53) and (377, 93).
; PLAN: r0=101(x1), r1=53(y1), r2=377(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 53
LDI r2, 377
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
