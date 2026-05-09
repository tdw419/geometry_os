; DESCRIPTION: Draws a cyan circle centered at (494, 185) with radius 11.
; PLAN: r0=494(x), r1=185(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 494
LDI r1, 185
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
