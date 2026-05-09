; DESCRIPTION: Draws a cyan circle centered at (53, 224) with radius 25.
; PLAN: r0=53(x), r1=224(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 224
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
