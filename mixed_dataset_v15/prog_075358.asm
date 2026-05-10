; DESCRIPTION: Renders a black line between points (312, 212) and (309, 194).
; PLAN: r0=312(x1), r1=212(y1), r2=309(x2), r3=194(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 212
LDI r2, 309
LDI r3, 194
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
