; DESCRIPTION: Renders a yellow line between points (29, 195) and (336, 15).
; PLAN: r0=29(x1), r1=195(y1), r2=336(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 195
LDI r2, 336
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
