; DESCRIPTION: Renders a blue line between points (286, 110) and (234, 245).
; PLAN: r0=286(x1), r1=110(y1), r2=234(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 110
LDI r2, 234
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
