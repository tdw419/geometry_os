; DESCRIPTION: Places a black line segment connecting (109, 142) to (308, 3).
; PLAN: r0=109(x1), r1=142(y1), r2=308(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 142
LDI r2, 308
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
