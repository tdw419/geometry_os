; DESCRIPTION: Places a black line segment connecting (282, 6) to (90, 199).
; PLAN: r0=282(x1), r1=6(y1), r2=90(x2), r3=199(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 6
LDI r2, 90
LDI r3, 199
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
