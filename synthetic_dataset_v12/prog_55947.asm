; DESCRIPTION: Renders a black line between points (322, 198) and (463, 114).
; PLAN: r0=322(x1), r1=198(y1), r2=463(x2), r3=114(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 198
LDI r2, 463
LDI r3, 114
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
