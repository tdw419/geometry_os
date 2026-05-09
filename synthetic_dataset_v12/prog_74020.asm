; DESCRIPTION: Renders a black line between points (418, 145) and (257, 127).
; PLAN: r0=418(x1), r1=145(y1), r2=257(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 145
LDI r2, 257
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
