; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (49, 35) with radius 32. Then Sets a single black pixel at (61, 213).
; PLAN: r0=49(x), r1=35(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=61(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a cyan circular shape at (49, 35) with radius 32.
; PLAN: r0=49(x), r1=35(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 35
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (61, 213).
; PLAN: r0=61(x), r1=213(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 61
LDI r1, 213
LDI r2, 0x000000
PSET r0, r1, r2
HALT
