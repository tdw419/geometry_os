; DESCRIPTION: Draws a cyan circle centered at (90, 130) with radius 18.
; PLAN: r0=90(x), r1=130(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 130
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
