; DESCRIPTION: Renders a blue line between points (222, 221) and (227, 230).
; PLAN: r0=222(x1), r1=221(y1), r2=227(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 221
LDI r2, 227
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
