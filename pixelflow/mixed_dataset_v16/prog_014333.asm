; DESCRIPTION: Composite: Draws a green circle centered at (401, 175) with radius 34 then Sets a single orange pixel at (24, 69).
; PLAN: r0=401(x), r1=175(y), r2=34(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=69(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 401
LDI r1, 175
LDI r2, 34
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 69
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
