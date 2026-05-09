; DESCRIPTION: Composite: . Then Creates a green circular shape at (113, 111) with radius 65. Then Sets a single white pixel at (16, 21).
; PLAN: r0=113(x), r1=111(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=16(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a green circular shape at (113, 111) with radius 65.
; PLAN: r0=113(x), r1=111(y), r2=65(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 111
LDI r2, 65
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single white pixel at (16, 21).
; PLAN: r0=16(x), r1=21(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 16
LDI r1, 21
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
