; DESCRIPTION: Places a black line segment connecting (338, 78) to (467, 158).
; PLAN: r0=338(x1), r1=78(y1), r2=467(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 78
LDI r2, 467
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
