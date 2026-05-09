; DESCRIPTION: Places a black line segment connecting (20, 38) to (26, 36).
; PLAN: r0=20(x1), r1=38(y1), r2=26(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 38
LDI r2, 26
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
