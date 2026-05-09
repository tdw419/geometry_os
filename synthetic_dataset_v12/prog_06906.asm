; DESCRIPTION: Renders a black line between points (40, 240) and (257, 254).
; PLAN: r0=40(x1), r1=240(y1), r2=257(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 240
LDI r2, 257
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
