; DESCRIPTION: Draws a cyan circle centered at (325, 122) with radius 63.
; PLAN: r0=325(x), r1=122(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 122
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
