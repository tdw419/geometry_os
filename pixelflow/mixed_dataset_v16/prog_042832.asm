; DESCRIPTION: Places a black line segment connecting (5, 5) to (47, 21).
; PLAN: r0=5(x1), r1=5(y1), r2=47(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 5
LDI r2, 47
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
