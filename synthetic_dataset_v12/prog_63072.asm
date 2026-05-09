; DESCRIPTION: Renders a blue line between points (233, 144) and (293, 245).
; PLAN: r0=233(x1), r1=144(y1), r2=293(x2), r3=245(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 144
LDI r2, 293
LDI r3, 245
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
