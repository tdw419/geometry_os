; DESCRIPTION: Composite: Draws a white circle centered at (212, 73) with radius 61 then Sets a single white pixel at (365, 151).
; PLAN: r0=212(x), r1=73(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=365(x), r6=151(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 73
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 365
LDI r6, 151
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
