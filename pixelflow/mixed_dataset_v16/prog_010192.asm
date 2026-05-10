; DESCRIPTION: Composite: Sets a single white pixel at (494, 82) then Draws a purple circle centered at (309, 161) with radius 33.
; PLAN: r0=494(x), r1=82(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=309(x), r6=161(y), r7=33(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 494
LDI r1, 82
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 309
LDI r6, 161
LDI r7, 33
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
