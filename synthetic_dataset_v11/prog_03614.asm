; DESCRIPTION: Renders a black line between points (2, 226) and (194, 140).
; PLAN: r0=2(x1), r1=226(y1), r2=194(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 226
LDI r2, 194
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
