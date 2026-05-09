; DESCRIPTION: Renders a red line between points (476, 29) and (93, 38).
; PLAN: r0=476(x1), r1=29(y1), r2=93(x2), r3=38(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 29
LDI r2, 93
LDI r3, 38
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
