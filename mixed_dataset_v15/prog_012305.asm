; DESCRIPTION: Renders a orange line between points (312, 63) and (257, 152).
; PLAN: r0=312(x1), r1=63(y1), r2=257(x2), r3=152(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 63
LDI r2, 257
LDI r3, 152
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
