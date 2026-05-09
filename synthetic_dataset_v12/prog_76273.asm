; DESCRIPTION: Composite: Draws a cyan circle centered at (127, 81) with radius 77 then Sets a single white pixel at (138, 116).
; PLAN: r0=127(x), r1=81(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=138(x), r6=116(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 81
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 138
LDI r6, 116
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
