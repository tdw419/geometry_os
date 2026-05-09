; DESCRIPTION: Draws a cyan circle centered at (254, 157) with radius 58.
; PLAN: r0=254(x), r1=157(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 157
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
