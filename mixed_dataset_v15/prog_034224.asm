; DESCRIPTION: Places a orange circle of radius 77 at center (257, 168).
; PLAN: r0=257(x), r1=168(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 257
LDI r1, 168
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
