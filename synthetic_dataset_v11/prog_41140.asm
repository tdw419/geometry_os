; DESCRIPTION: Renders a black line between points (141, 101) and (43, 207).
; PLAN: r0=141(x1), r1=101(y1), r2=43(x2), r3=207(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 101
LDI r2, 43
LDI r3, 207
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
