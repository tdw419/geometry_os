; DESCRIPTION: Draws a cyan circle centered at (83, 87) with radius 22.
; PLAN: r0=83(x), r1=87(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 87
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
