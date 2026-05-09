; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (92, 255). Then Draws a black circle centered at (83, 26) with radius 14.
; PLAN: r0=92(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=83(x), r1=26(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (92, 255).
; PLAN: r0=92(x), r1=255(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 92
LDI r1, 255
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (83, 26) with radius 14.
; PLAN: r0=83(x), r1=26(y), r2=14(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 26
LDI r2, 14
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
