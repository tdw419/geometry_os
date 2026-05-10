; DESCRIPTION: Composite: Draws a magenta circle centered at (331, 175) with radius 80 then Sets a single magenta pixel at (372, 218).
; PLAN: r0=331(x), r1=175(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=218(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 175
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 218
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
