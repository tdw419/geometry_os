; DESCRIPTION: Composite: Draws a white circle centered at (241, 154) with radius 10 then Sets a single white pixel at (285, 46).
; PLAN: r0=241(x), r1=154(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=46(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 241
LDI r1, 154
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 46
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
