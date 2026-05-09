; DESCRIPTION: Renders a blue line between points (293, 106) and (232, 55).
; PLAN: r0=293(x1), r1=106(y1), r2=232(x2), r3=55(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 106
LDI r2, 232
LDI r3, 55
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
