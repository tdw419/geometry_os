; DESCRIPTION: Draws a cyan circle centered at (33, 39) with radius 33.
; PLAN: r0=33(x), r1=39(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 33
LDI r1, 39
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
