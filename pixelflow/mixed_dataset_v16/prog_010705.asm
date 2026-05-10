; DESCRIPTION: Renders a black line between points (35, 232) and (327, 185).
; PLAN: r0=35(x1), r1=232(y1), r2=327(x2), r3=185(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 232
LDI r2, 327
LDI r3, 185
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
