; DESCRIPTION: Composite: . Then Creates a black circular shape at (187, 154) with radius 57. Then Sets a single magenta pixel at (241, 39).
; PLAN: r0=187(x), r1=154(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=241(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (187, 154) with radius 57.
; PLAN: r0=187(x), r1=154(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 154
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single magenta pixel at (241, 39).
; PLAN: r0=241(x), r1=39(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 241
LDI r1, 39
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
