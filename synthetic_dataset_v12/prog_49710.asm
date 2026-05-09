; DESCRIPTION: Draws a cyan circle centered at (107, 83) with radius 76.
; PLAN: r0=107(x), r1=83(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 83
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
