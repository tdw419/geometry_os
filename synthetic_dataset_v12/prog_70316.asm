; DESCRIPTION: Draws a cyan circle centered at (324, 158) with radius 55.
; PLAN: r0=324(x), r1=158(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 324
LDI r1, 158
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
