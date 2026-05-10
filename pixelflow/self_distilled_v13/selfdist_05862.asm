; DESCRIPTION: Draws a orange line from (138, 17) to (257, 183).
; PLAN: r0=138(x1), r1=17(y1), r2=257(x2), r3=183(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 17
LDI r2, 257
LDI r3, 183
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
