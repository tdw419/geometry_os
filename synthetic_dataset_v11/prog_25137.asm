; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (191, 204) with radius 52. Then Places a black dot at position (18, 61).
; PLAN: r0=191(x), r1=204(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=18(x), r1=61(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (191, 204) with radius 52.
; PLAN: r0=191(x), r1=204(y), r2=52(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 204
LDI r2, 52
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a black dot at position (18, 61).
; PLAN: r0=18(x), r1=61(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 18
LDI r1, 61
LDI r2, 0x000000
PSET r0, r1, r2
HALT
