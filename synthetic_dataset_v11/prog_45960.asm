; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (68, 170). Then Creates a yellow circular shape at (97, 85) with radius 63.
; PLAN: r0=68(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=97(x), r1=85(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single yellow pixel at (68, 170).
; PLAN: r0=68(x), r1=170(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 170
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Creates a yellow circular shape at (97, 85) with radius 63.
; PLAN: r0=97(x), r1=85(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 85
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
