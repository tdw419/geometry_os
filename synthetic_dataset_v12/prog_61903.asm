; DESCRIPTION: Creates a orange circular shape at (345, 204) with radius 32.
; PLAN: r0=345(x), r1=204(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 345
LDI r1, 204
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
