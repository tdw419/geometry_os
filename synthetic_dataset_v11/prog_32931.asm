; DESCRIPTION: Places a black line segment connecting (5, 236) to (40, 64).
; PLAN: r0=5(x1), r1=236(y1), r2=40(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 236
LDI r2, 40
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
