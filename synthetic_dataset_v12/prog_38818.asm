; DESCRIPTION: Composite: Draws a white circle centered at (198, 101) with radius 62 then Sets a single purple pixel at (278, 179).
; PLAN: r0=198(x), r1=101(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=278(x), r6=179(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 101
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 278
LDI r6, 179
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
