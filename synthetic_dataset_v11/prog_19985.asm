; DESCRIPTION: Draws a black circle centered at (171, 87) with radius 31.
; PLAN: r0=171(x), r1=87(y), r2=31(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 87
LDI r2, 31
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
