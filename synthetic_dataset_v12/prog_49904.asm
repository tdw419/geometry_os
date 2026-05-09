; DESCRIPTION: Draws a cyan circle centered at (139, 87) with radius 44.
; PLAN: r0=139(x), r1=87(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 87
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
