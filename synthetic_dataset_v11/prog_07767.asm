; DESCRIPTION: Places a black line segment connecting (240, 58) to (119, 180).
; PLAN: r0=240(x1), r1=58(y1), r2=119(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 58
LDI r2, 119
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
