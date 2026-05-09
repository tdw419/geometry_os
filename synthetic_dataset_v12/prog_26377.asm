; DESCRIPTION: Composite: Places a white circle of radius 28 at center (164, 206) then Sets a single magenta pixel at (343, 53).
; PLAN: r0=164(x), r1=206(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=53(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 164
LDI r1, 206
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 53
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
