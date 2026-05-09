; DESCRIPTION: Creates a cyan circular shape at (239, 130) with radius 79.
; PLAN: r0=239(x), r1=130(y), r2=79(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 239
LDI r1, 130
LDI r2, 79
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
