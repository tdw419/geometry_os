; DESCRIPTION: Draws a white line from (257, 234) to (464, 184).
; PLAN: r0=257(x1), r1=234(y1), r2=464(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 234
LDI r2, 464
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
