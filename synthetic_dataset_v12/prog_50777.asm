; DESCRIPTION: Renders a blue line between points (397, 81) and (347, 54).
; PLAN: r0=397(x1), r1=81(y1), r2=347(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 81
LDI r2, 347
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
