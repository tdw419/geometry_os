; DESCRIPTION: Places a black line segment connecting (324, 52) to (317, 3).
; PLAN: r0=324(x1), r1=52(y1), r2=317(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 52
LDI r2, 317
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
