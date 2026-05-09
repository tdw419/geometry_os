; DESCRIPTION: Creates a yellow circular shape at (361, 166) with radius 56.
; PLAN: r0=361(x), r1=166(y), r2=56(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 166
LDI r2, 56
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
