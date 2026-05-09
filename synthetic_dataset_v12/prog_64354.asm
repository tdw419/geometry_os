; DESCRIPTION: Places a black line segment connecting (425, 43) to (163, 240).
; PLAN: r0=425(x1), r1=43(y1), r2=163(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 43
LDI r2, 163
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
