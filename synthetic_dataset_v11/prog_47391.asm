; DESCRIPTION: Draws a cyan circle centered at (105, 117) with radius 62.
; PLAN: r0=105(x), r1=117(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 105
LDI r1, 117
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
