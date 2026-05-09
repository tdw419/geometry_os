; DESCRIPTION: Draws a cyan circle centered at (293, 87) with radius 13.
; PLAN: r0=293(x), r1=87(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 87
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
