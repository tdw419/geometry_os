; DESCRIPTION: Places a black line segment connecting (126, 41) to (257, 189).
; PLAN: r0=126(x1), r1=41(y1), r2=257(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 41
LDI r2, 257
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
