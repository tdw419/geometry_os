; DESCRIPTION: Composite: Draws a cyan circle centered at (244, 77) with radius 69 then Sets a single white pixel at (477, 255).
; PLAN: r0=244(x), r1=77(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x), r6=255(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 244
LDI r1, 77
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 255
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
