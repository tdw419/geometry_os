; DESCRIPTION: Draws a cyan circle centered at (137, 102) with radius 74.
; PLAN: r0=137(x), r1=102(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 102
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
