; DESCRIPTION: Composite: . Then Sets a single black pixel at (86, 225). Then Creates a green circular shape at (116, 136) with radius 72.
; PLAN: r0=86(x), r1=225(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=116(x), r1=136(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (86, 225).
; PLAN: r0=86(x), r1=225(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 225
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a green circular shape at (116, 136) with radius 72.
; PLAN: r0=116(x), r1=136(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 136
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
