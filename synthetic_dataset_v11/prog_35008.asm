; DESCRIPTION: Composite: . Then Creates a black circular shape at (48, 88) with radius 33. Then Sets a single orange pixel at (103, 210).
; PLAN: r0=48(x), r1=88(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=103(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a black circular shape at (48, 88) with radius 33.
; PLAN: r0=48(x), r1=88(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 48
LDI r1, 88
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single orange pixel at (103, 210).
; PLAN: r0=103(x), r1=210(y), r2=0xFF8800(color). Op: PSET r0, r1, r2.
LDI r0, 103
LDI r1, 210
LDI r2, 0xFF8800
PSET r0, r1, r2
HALT
