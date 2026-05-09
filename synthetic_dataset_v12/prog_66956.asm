; DESCRIPTION: Places a black line segment connecting (14, 38) to (426, 110).
; PLAN: r0=14(x1), r1=38(y1), r2=426(x2), r3=110(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 38
LDI r2, 426
LDI r3, 110
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
