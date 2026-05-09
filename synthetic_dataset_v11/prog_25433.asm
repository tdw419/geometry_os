; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (217, 40) with radius 29. Then Sets a single orange pixel at (156, 128).
; PLAN: r0=217(x), r1=40(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=156(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (217, 40) with radius 29.
; PLAN: r0=217(x), r1=40(y), r2=29(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 40
LDI r2, 29
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (156, 128).
; PLAN: r0=156(x), r1=128(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 156
LDI r1, 128
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
