; DESCRIPTION: Renders a blue line between points (500, 73) and (452, 159).
; PLAN: r0=500(x1), r1=73(y1), r2=452(x2), r3=159(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 73
LDI r2, 452
LDI r3, 159
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
