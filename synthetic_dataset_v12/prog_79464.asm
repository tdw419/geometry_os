; DESCRIPTION: Renders a black line between points (496, 75) and (497, 3).
; PLAN: r0=496(x1), r1=75(y1), r2=497(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 75
LDI r2, 497
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
