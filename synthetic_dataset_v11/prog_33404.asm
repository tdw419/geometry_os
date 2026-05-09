; DESCRIPTION: Composite: . Then Creates a black circular shape at (121, 137) with radius 57. Then Places a orange dot at position (129, 237).
; PLAN: r0=121(x), r1=137(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=129(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (121, 137) with radius 57.
; PLAN: r0=121(x), r1=137(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 137
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange dot at position (129, 237).
; PLAN: r0=129(x), r1=237(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 129
LDI r1, 237
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
