; DESCRIPTION: Renders a black line between points (136, 195) and (232, 82).
; PLAN: r0=136(x1), r1=195(y1), r2=232(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 195
LDI r2, 232
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
