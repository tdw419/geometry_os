; DESCRIPTION: Places a black line segment connecting (15, 52) to (101, 64).
; PLAN: r0=15(x1), r1=52(y1), r2=101(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 52
LDI r2, 101
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
