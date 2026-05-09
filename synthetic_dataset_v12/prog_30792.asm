; DESCRIPTION: Draws a white line from (257, 19) to (122, 65).
; PLAN: r0=257(x1), r1=19(y1), r2=122(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 19
LDI r2, 122
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
