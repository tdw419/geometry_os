; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (215, 97). Then Creates a orange circular shape at (31, 107) with radius 30.
; PLAN: r0=215(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=31(x), r1=107(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (215, 97).
; PLAN: r0=215(x), r1=97(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 215
LDI r1, 97
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a orange circular shape at (31, 107) with radius 30.
; PLAN: r0=31(x), r1=107(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 107
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
