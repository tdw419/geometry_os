; DESCRIPTION: Composite: Draws a black circle centered at (242, 67) with radius 60 then Sets a single green pixel at (53, 129).
; PLAN: r0=242(x), r1=67(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x), r6=129(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 67
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 129
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
