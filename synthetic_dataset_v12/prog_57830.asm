; DESCRIPTION: Draws a black line from (289, 161) to (257, 198).
; PLAN: r0=289(x1), r1=161(y1), r2=257(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 161
LDI r2, 257
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
