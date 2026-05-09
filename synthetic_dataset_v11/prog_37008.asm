; DESCRIPTION: Composite: . Then Creates a orange circular shape at (172, 219) with radius 31. Then Sets a single black pixel at (48, 30).
; PLAN: r0=172(x), r1=219(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=48(x), r1=30(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a orange circular shape at (172, 219) with radius 31.
; PLAN: r0=172(x), r1=219(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 219
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (48, 30).
; PLAN: r0=48(x), r1=30(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 48
LDI r1, 30
LDI r2, 0x000000
PSET r0, r1, r2
HALT
