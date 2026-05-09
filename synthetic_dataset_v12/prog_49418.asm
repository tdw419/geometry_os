; DESCRIPTION: Places a black line segment connecting (105, 180) to (131, 98).
; PLAN: r0=105(x1), r1=180(y1), r2=131(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 180
LDI r2, 131
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
