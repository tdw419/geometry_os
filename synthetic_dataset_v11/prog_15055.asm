; DESCRIPTION: Renders a yellow line between points (159, 73) and (96, 194).
; PLAN: r0=159(x1), r1=73(y1), r2=96(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 73
LDI r2, 96
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
