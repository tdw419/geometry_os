; DESCRIPTION: Renders a black line between points (238, 2) and (424, 247).
; PLAN: r0=238(x1), r1=2(y1), r2=424(x2), r3=247(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 2
LDI r2, 424
LDI r3, 247
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
