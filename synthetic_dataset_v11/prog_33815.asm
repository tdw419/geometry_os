; DESCRIPTION: Draws a cyan circle centered at (52, 122) with radius 43.
; PLAN: r0=52(x), r1=122(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 52
LDI r1, 122
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
