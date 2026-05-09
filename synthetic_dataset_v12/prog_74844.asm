; DESCRIPTION: Places a black line segment connecting (508, 128) to (463, 94).
; PLAN: r0=508(x1), r1=128(y1), r2=463(x2), r3=94(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 128
LDI r2, 463
LDI r3, 94
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
