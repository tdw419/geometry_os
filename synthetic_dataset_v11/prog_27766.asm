; DESCRIPTION: Composite: . Then Places a black dot at position (173, 173). Then Creates a white circular shape at (194, 99) with radius 58.
; PLAN: r0=173(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=194(x), r1=99(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (173, 173).
; PLAN: r0=173(x), r1=173(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 173
LDI r1, 173
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (194, 99) with radius 58.
; PLAN: r0=194(x), r1=99(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 99
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
