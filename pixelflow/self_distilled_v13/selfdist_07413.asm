; DESCRIPTION: Draws a white line from (257, 138) to (361, 179).
; PLAN: r0=257(x1), r1=138(y1), r2=361(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 138
LDI r2, 361
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
