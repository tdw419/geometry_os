; DESCRIPTION: Composite: . Then Creates a magenta circular shape at (204, 88) with radius 33. Then Sets a single cyan pixel at (44, 237).
; PLAN: r0=204(x), r1=88(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=44(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a magenta circular shape at (204, 88) with radius 33.
; PLAN: r0=204(x), r1=88(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 88
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (44, 237).
; PLAN: r0=44(x), r1=237(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 44
LDI r1, 237
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
