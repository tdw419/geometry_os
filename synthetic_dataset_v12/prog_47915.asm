; DESCRIPTION: Composite: Draws a green circle centered at (437, 142) with radius 51 then Sets a single white pixel at (38, 131).
; PLAN: r0=437(x), r1=142(y), r2=51(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=38(x), r6=131(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 437
LDI r1, 142
LDI r2, 51
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 38
LDI r6, 131
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
