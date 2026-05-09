; DESCRIPTION: Draws a cyan circle centered at (205, 159) with radius 31.
; PLAN: r0=205(x), r1=159(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 159
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
