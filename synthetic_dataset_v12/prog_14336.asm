; DESCRIPTION: Renders a black line between points (498, 119) and (296, 102).
; PLAN: r0=498(x1), r1=119(y1), r2=296(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 119
LDI r2, 296
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
