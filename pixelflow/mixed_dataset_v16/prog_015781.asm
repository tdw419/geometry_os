; DESCRIPTION: Renders a black line between points (226, 238) and (421, 121).
; PLAN: r0=226(x1), r1=238(y1), r2=421(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 238
LDI r2, 421
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
