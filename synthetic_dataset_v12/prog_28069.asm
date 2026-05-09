; DESCRIPTION: Renders a black line between points (214, 24) and (496, 118).
; PLAN: r0=214(x1), r1=24(y1), r2=496(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 24
LDI r2, 496
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
