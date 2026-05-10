; DESCRIPTION: Composite: Draws a black circle centered at (218, 193) with radius 40 then Sets a single white pixel at (34, 17).
; PLAN: r0=218(x), r1=193(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=17(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 218
LDI r1, 193
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 17
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
