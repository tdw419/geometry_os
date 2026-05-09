; DESCRIPTION: Renders a green line between points (343, 198) and (491, 238).
; PLAN: r0=343(x1), r1=198(y1), r2=491(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 198
LDI r2, 491
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
