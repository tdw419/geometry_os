; DESCRIPTION: Draws a cyan circle centered at (325, 39) with radius 30.
; PLAN: r0=325(x), r1=39(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 39
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
