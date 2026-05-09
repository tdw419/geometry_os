; DESCRIPTION: Renders a black line between points (270, 174) and (378, 17).
; PLAN: r0=270(x1), r1=174(y1), r2=378(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 174
LDI r2, 378
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
