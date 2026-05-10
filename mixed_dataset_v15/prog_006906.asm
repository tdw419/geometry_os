; DESCRIPTION: Places a black line segment connecting (240, 47) to (232, 79).
; PLAN: r0=240(x1), r1=47(y1), r2=232(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 47
LDI r2, 232
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
