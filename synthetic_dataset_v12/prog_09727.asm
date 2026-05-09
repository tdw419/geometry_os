; DESCRIPTION: Renders a blue line between points (483, 225) and (452, 116).
; PLAN: r0=483(x1), r1=225(y1), r2=452(x2), r3=116(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 225
LDI r2, 452
LDI r3, 116
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
