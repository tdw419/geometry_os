; DESCRIPTION: Draws a cyan circle centered at (268, 76) with radius 69.
; PLAN: r0=268(x), r1=76(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 76
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
