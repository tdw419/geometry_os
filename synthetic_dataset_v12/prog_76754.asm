; DESCRIPTION: Draws a white line from (257, 12) to (316, 138).
; PLAN: r0=257(x1), r1=12(y1), r2=316(x2), r3=138(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 12
LDI r2, 316
LDI r3, 138
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
