; DESCRIPTION: Draws a cyan circle centered at (329, 114) with radius 11.
; PLAN: r0=329(x), r1=114(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 114
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
