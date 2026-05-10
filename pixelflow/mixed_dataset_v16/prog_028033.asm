; DESCRIPTION: Composite: Draws a cyan circle centered at (60, 46) with radius 32 then Sets a single blue pixel at (245, 66).
; PLAN: r0=60(x), r1=46(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=66(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 60
LDI r1, 46
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 66
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
