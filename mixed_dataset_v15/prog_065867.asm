; DESCRIPTION: Composite: Sets a single white pixel at (185, 4) then Draws a blue circle centered at (142, 53) with radius 34.
; PLAN: r0=185(x), r1=4(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=53(y), r7=34(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 185
LDI r1, 4
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 142
LDI r6, 53
LDI r7, 34
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
