; DESCRIPTION: Composite: Sets a single magenta pixel at (74, 217) then Draws a white circle centered at (343, 134) with radius 33.
; PLAN: r0=74(x), r1=217(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=343(x), r6=134(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 74
LDI r1, 217
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 343
LDI r6, 134
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
