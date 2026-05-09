; DESCRIPTION: Draws a cyan circle centered at (164, 78) with radius 49.
; PLAN: r0=164(x), r1=78(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 78
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
