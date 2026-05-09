; DESCRIPTION: Renders a black line between points (81, 233) and (191, 105).
; PLAN: r0=81(x1), r1=233(y1), r2=191(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 233
LDI r2, 191
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
