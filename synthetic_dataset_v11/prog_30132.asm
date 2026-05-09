; DESCRIPTION: Renders a black line between points (38, 158) and (226, 12).
; PLAN: r0=38(x1), r1=158(y1), r2=226(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 158
LDI r2, 226
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
