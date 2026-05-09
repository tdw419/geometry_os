; DESCRIPTION: Renders a black line between points (168, 141) and (93, 72).
; PLAN: r0=168(x1), r1=141(y1), r2=93(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 141
LDI r2, 93
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
