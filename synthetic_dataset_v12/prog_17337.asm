; DESCRIPTION: Places a black line segment connecting (500, 135) to (289, 110).
; PLAN: r0=500(x1), r1=135(y1), r2=289(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 135
LDI r2, 289
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
