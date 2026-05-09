; DESCRIPTION: Draws a cyan circle centered at (122, 155) with radius 39.
; PLAN: r0=122(x), r1=155(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 155
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
