; DESCRIPTION: Draws a black line from (257, 218) to (491, 251).
; PLAN: r0=257(x1), r1=218(y1), r2=491(x2), r3=251(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 218
LDI r2, 491
LDI r3, 251
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
