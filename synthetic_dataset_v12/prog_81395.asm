; DESCRIPTION: Creates a yellow circular shape at (361, 159) with radius 77.
; PLAN: r0=361(x), r1=159(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 159
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
