; DESCRIPTION: Renders a black line between points (155, 101) and (205, 246).
; PLAN: r0=155(x1), r1=101(y1), r2=205(x2), r3=246(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 101
LDI r2, 205
LDI r3, 246
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
