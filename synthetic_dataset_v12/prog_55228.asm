; DESCRIPTION: Places a black line segment connecting (464, 155) to (95, 199).
; PLAN: r0=464(x1), r1=155(y1), r2=95(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 155
LDI r2, 95
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
