; DESCRIPTION: Composite: . Then Creates a orange circular shape at (162, 182) with radius 62. Then Sets a single black pixel at (240, 101).
; PLAN: r0=162(x), r1=182(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=240(x), r1=101(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (162, 182) with radius 62.
; PLAN: r0=162(x), r1=182(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 182
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (240, 101).
; PLAN: r0=240(x), r1=101(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 240
LDI r1, 101
LDI r2, 0x000000
PSET r0, r1, r2
HALT
