; DESCRIPTION: Composite: Sets a single blue pixel at (493, 210) then Draws a white circle centered at (405, 163) with radius 79.
; PLAN: r0=493(x), r1=210(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=405(x), r6=163(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 493
LDI r1, 210
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 405
LDI r6, 163
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
