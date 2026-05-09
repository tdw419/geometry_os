; DESCRIPTION: Creates a cyan circular shape at (285, 132) with radius 62.
; PLAN: r0=285(x), r1=132(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 132
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
