; DESCRIPTION: Composite: . Then Sets a single black pixel at (175, 221). Then Creates a white circular shape at (90, 123) with radius 64.
; PLAN: r0=175(x), r1=221(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=90(x), r1=123(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (175, 221).
; PLAN: r0=175(x), r1=221(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 175
LDI r1, 221
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Creates a white circular shape at (90, 123) with radius 64.
; PLAN: r0=90(x), r1=123(y), r2=64(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 123
LDI r2, 64
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
