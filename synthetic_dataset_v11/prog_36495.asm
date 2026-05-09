; DESCRIPTION: Renders a black line between points (18, 119) and (114, 158).
; PLAN: r0=18(x1), r1=119(y1), r2=114(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 119
LDI r2, 114
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
