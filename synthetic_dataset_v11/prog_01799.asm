; DESCRIPTION: Renders a black line between points (194, 162) and (82, 43).
; PLAN: r0=194(x1), r1=162(y1), r2=82(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 162
LDI r2, 82
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
