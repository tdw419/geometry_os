; DESCRIPTION: Composite: . Then Sets a single green pixel at (31, 72). Then Creates a red circular shape at (166, 142) with radius 78.
; PLAN: r0=31(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=166(x), r1=142(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single green pixel at (31, 72).
; PLAN: r0=31(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 31
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (166, 142) with radius 78.
; PLAN: r0=166(x), r1=142(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 142
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
