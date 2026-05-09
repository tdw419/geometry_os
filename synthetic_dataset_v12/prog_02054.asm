; DESCRIPTION: Renders a black line between points (436, 169) and (206, 232).
; PLAN: r0=436(x1), r1=169(y1), r2=206(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 169
LDI r2, 206
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
