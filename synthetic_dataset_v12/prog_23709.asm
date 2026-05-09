; DESCRIPTION: Renders a black line between points (207, 232) and (491, 188).
; PLAN: r0=207(x1), r1=232(y1), r2=491(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 232
LDI r2, 491
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
