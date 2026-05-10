; DESCRIPTION: Renders a orange line between points (378, 225) and (454, 122).
; PLAN: r0=378(x1), r1=225(y1), r2=454(x2), r3=122(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 225
LDI r2, 454
LDI r3, 122
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
