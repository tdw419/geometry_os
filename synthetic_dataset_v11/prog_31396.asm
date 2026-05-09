; DESCRIPTION: Renders a orange line between points (160, 240) and (177, 245).
; PLAN: r0=160(x1), r1=240(y1), r2=177(x2), r3=245(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 240
LDI r2, 177
LDI r3, 245
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
