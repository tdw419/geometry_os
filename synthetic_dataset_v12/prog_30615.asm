; DESCRIPTION: Composite: Draws a magenta circle centered at (301, 116) with radius 79 then Sets a single magenta pixel at (469, 196).
; PLAN: r0=301(x), r1=116(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x), r6=196(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 301
LDI r1, 116
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 196
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
