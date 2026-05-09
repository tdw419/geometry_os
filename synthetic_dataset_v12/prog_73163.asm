; DESCRIPTION: Renders a black line between points (17, 140) and (311, 75).
; PLAN: r0=17(x1), r1=140(y1), r2=311(x2), r3=75(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 140
LDI r2, 311
LDI r3, 75
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
