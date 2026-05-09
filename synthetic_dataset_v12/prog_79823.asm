; DESCRIPTION: Renders a blue line between points (347, 245) and (354, 140).
; PLAN: r0=347(x1), r1=245(y1), r2=354(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 245
LDI r2, 354
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
