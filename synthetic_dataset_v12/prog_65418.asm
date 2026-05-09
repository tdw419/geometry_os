; DESCRIPTION: Creates a cyan circular shape at (243, 130) with radius 69.
; PLAN: r0=243(x), r1=130(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 243
LDI r1, 130
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
