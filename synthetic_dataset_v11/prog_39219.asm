; DESCRIPTION: Composite: . Then Sets a single cyan pixel at (126, 21). Then Draws a black circle centered at (135, 182) with radius 31.
; PLAN: r0=126(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r0=135(x), r1=182(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single cyan pixel at (126, 21).
; PLAN: r0=126(x), r1=21(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 21
LDI r2, 0x00FFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a black circle centered at (135, 182) with radius 31.
; PLAN: r0=135(x), r1=182(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 182
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
