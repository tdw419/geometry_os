; DESCRIPTION: Renders a black line between points (8, 158) and (141, 186).
; PLAN: r0=8(x1), r1=158(y1), r2=141(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 158
LDI r2, 141
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
