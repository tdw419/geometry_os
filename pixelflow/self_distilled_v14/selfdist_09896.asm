; DESCRIPTION: Draws a cyan circle centered at (266, 2) with radius 39.
; PLAN: r0=266(x), r1=2(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 2
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
