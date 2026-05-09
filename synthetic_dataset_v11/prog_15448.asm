; DESCRIPTION: Renders a black line between points (241, 233) and (101, 109).
; PLAN: r0=241(x1), r1=233(y1), r2=101(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 233
LDI r2, 101
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
