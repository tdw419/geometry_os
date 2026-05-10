; DESCRIPTION: Creates a cyan circular shape at (375, 130) with radius 50.
; PLAN: r0=375(x), r1=130(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 130
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
