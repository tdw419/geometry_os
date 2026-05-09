; DESCRIPTION: Draws a cyan circle centered at (332, 176) with radius 69.
; PLAN: r0=332(x), r1=176(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 176
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
