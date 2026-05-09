; DESCRIPTION: Draws a cyan circle centered at (223, 101) with radius 35.
; PLAN: r0=223(x), r1=101(y), r2=35(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 101
LDI r2, 35
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
