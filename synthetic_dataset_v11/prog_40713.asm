; DESCRIPTION: Creates a magenta circular shape at (102, 204) with radius 18.
; PLAN: r0=102(x), r1=204(y), r2=18(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 204
LDI r2, 18
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
