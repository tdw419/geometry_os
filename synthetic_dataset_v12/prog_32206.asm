; DESCRIPTION: Draws a white line from (58, 243) to (257, 53).
; PLAN: r0=58(x1), r1=243(y1), r2=257(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 243
LDI r2, 257
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
