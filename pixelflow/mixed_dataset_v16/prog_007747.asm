; DESCRIPTION: Renders a blue line between points (332, 155) and (429, 60).
; PLAN: r0=332(x1), r1=155(y1), r2=429(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 155
LDI r2, 429
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
