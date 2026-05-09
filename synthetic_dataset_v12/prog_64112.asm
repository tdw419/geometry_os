; DESCRIPTION: Draws a white line from (257, 100) to (341, 129).
; PLAN: r0=257(x1), r1=100(y1), r2=341(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 100
LDI r2, 341
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
