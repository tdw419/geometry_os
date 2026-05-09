; DESCRIPTION: Renders a black line between points (324, 244) and (424, 232).
; PLAN: r0=324(x1), r1=244(y1), r2=424(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 244
LDI r2, 424
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
