; DESCRIPTION: Creates a red circular shape at (361, 63) with radius 21.
; PLAN: r0=361(x), r1=63(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 63
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
