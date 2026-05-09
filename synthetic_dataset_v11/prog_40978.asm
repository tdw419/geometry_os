; DESCRIPTION: Composite: . Then Places a black dot at position (176, 239). Then Creates a black circular shape at (148, 110) with radius 28.
; PLAN: r0=176(x), r1=239(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=148(x), r1=110(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a black dot at position (176, 239).
; PLAN: r0=176(x), r1=239(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 176
LDI r1, 239
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a black circular shape at (148, 110) with radius 28.
; PLAN: r0=148(x), r1=110(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 110
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
