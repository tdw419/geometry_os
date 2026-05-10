; DESCRIPTION: Renders a green line between points (318, 245) and (378, 80).
; PLAN: r0=318(x1), r1=245(y1), r2=378(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 245
LDI r2, 378
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
