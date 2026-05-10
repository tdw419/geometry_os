; DESCRIPTION: Draws a black line from (383, 61) to (336, 201).
; PLAN: r0=383(x1), r1=61(y1), r2=336(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 61
LDI r2, 336
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
