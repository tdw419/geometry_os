; DESCRIPTION: Draws a cyan circle centered at (254, 137) with radius 18.
; PLAN: r0=254(x), r1=137(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 137
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
