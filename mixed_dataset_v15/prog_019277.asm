; DESCRIPTION: Draws a cyan circle centered at (329, 155) with radius 47.
; PLAN: r0=329(x), r1=155(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 329
LDI r1, 155
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
