; DESCRIPTION: Creates a cyan circular shape at (226, 130) with radius 43.
; PLAN: r0=226(x), r1=130(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 226
LDI r1, 130
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
