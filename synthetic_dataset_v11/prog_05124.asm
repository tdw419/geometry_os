; DESCRIPTION: Composite: . Then Creates a black circular shape at (183, 115) with radius 71. Then Places a white dot at position (146, 104).
; PLAN: r0=183(x), r1=115(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=146(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (183, 115) with radius 71.
; PLAN: r0=183(x), r1=115(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 115
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a white dot at position (146, 104).
; PLAN: r0=146(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 146
LDI r1, 104
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
