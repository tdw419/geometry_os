; DESCRIPTION: Renders a yellow line between points (238, 51) and (44, 136).
; PLAN: r0=238(x1), r1=51(y1), r2=44(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 51
LDI r2, 44
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
