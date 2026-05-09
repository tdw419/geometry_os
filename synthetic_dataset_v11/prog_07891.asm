; DESCRIPTION: Renders a black line between points (66, 36) and (232, 66).
; PLAN: r0=66(x1), r1=36(y1), r2=232(x2), r3=66(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 36
LDI r2, 232
LDI r3, 66
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
