; DESCRIPTION: Composite: Sets a single magenta pixel at (171, 221) then Draws a white circle centered at (391, 224) with radius 15.
; PLAN: r0=171(x), r1=221(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=391(x), r6=224(y), r7=15(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 171
LDI r1, 221
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 391
LDI r6, 224
LDI r7, 15
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
