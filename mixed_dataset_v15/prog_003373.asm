; DESCRIPTION: Composite: Places a magenta circle of radius 11 at center (376, 39) then Sets a single white pixel at (176, 88).
; PLAN: r0=376(x), r1=39(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x), r6=88(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 376
LDI r1, 39
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 88
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
