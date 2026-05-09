; DESCRIPTION: Renders a blue line between points (15, 54) and (159, 44).
; PLAN: r0=15(x1), r1=54(y1), r2=159(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 54
LDI r2, 159
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
