; DESCRIPTION: Renders a black line between points (378, 226) and (359, 72).
; PLAN: r0=378(x1), r1=226(y1), r2=359(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 226
LDI r2, 359
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
