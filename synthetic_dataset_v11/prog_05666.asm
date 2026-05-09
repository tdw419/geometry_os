; DESCRIPTION: Composite: . Then Sets a single white pixel at (85, 104). Then Draws a orange circle centered at (119, 143) with radius 72.
; PLAN: r0=85(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=119(x), r1=143(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single white pixel at (85, 104).
; PLAN: r0=85(x), r1=104(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 85
LDI r1, 104
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Draws a orange circle centered at (119, 143) with radius 72.
; PLAN: r0=119(x), r1=143(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 143
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
