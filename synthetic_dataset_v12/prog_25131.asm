; DESCRIPTION: Draws a cyan circle centered at (26, 141) with radius 17.
; PLAN: r0=26(x), r1=141(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 26
LDI r1, 141
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
