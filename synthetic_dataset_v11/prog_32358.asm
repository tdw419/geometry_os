; DESCRIPTION: Composite: . Then Creates a orange circular shape at (148, 101) with radius 13. Then Sets a single green pixel at (172, 86).
; PLAN: r0=148(x), r1=101(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=172(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (148, 101) with radius 13.
; PLAN: r0=148(x), r1=101(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 101
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single green pixel at (172, 86).
; PLAN: r0=172(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 172
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
