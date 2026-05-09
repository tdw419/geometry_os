; DESCRIPTION: Renders a black line between points (361, 18) and (153, 78).
; PLAN: r0=361(x1), r1=18(y1), r2=153(x2), r3=78(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 18
LDI r2, 153
LDI r3, 78
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
