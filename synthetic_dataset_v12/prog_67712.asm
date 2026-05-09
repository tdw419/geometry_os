; DESCRIPTION: Renders a yellow line between points (155, 167) and (198, 193).
; PLAN: r0=155(x1), r1=167(y1), r2=198(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 167
LDI r2, 198
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
