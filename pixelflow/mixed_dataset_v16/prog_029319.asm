; DESCRIPTION: Places a black line segment connecting (496, 95) to (239, 25).
; PLAN: r0=496(x1), r1=95(y1), r2=239(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 95
LDI r2, 239
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
