; DESCRIPTION: Draws a yellow line from (421, 16) to (257, 82).
; PLAN: r0=421(x1), r1=16(y1), r2=257(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 16
LDI r2, 257
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
