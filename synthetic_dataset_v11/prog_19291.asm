; DESCRIPTION: Renders a yellow line between points (164, 39) and (232, 129).
; PLAN: r0=164(x1), r1=39(y1), r2=232(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 39
LDI r2, 232
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
