; DESCRIPTION: Places a black line segment connecting (338, 96) to (282, 92).
; PLAN: r0=338(x1), r1=96(y1), r2=282(x2), r3=92(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 96
LDI r2, 282
LDI r3, 92
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
