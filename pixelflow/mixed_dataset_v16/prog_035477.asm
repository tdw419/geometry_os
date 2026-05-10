; DESCRIPTION: Renders a black line between points (497, 17) and (83, 24).
; PLAN: r0=497(x1), r1=17(y1), r2=83(x2), r3=24(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 17
LDI r2, 83
LDI r3, 24
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
