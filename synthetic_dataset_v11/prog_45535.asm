; DESCRIPTION: Renders a black line between points (6, 226) and (8, 194).
; PLAN: r0=6(x1), r1=226(y1), r2=8(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 226
LDI r2, 8
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
