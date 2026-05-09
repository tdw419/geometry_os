; DESCRIPTION: Draws a cyan circle centered at (274, 212) with radius 33.
; PLAN: r0=274(x), r1=212(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 274
LDI r1, 212
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
