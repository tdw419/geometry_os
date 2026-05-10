; DESCRIPTION: Places a black line segment connecting (500, 30) to (376, 72).
; PLAN: r0=500(x1), r1=30(y1), r2=376(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 30
LDI r2, 376
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
