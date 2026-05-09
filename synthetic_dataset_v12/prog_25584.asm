; DESCRIPTION: Draws a cyan circle centered at (204, 114) with radius 37.
; PLAN: r0=204(x), r1=114(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 204
LDI r1, 114
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
