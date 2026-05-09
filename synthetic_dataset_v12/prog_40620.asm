; DESCRIPTION: Places a black line segment connecting (318, 235) to (421, 199).
; PLAN: r0=318(x1), r1=235(y1), r2=421(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 235
LDI r2, 421
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
