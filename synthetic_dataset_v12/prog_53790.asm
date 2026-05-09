; DESCRIPTION: Renders a black line between points (312, 43) and (311, 44).
; PLAN: r0=312(x1), r1=43(y1), r2=311(x2), r3=44(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 43
LDI r2, 311
LDI r3, 44
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
