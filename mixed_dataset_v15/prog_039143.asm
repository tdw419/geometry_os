; DESCRIPTION: Composite: Creates a magenta circular shape at (242, 192) with radius 37 then Sets a single black pixel at (358, 170).
; PLAN: r0=242(x), r1=192(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=170(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 242
LDI r1, 192
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 170
LDI r7, 0x000000
PSET r5, r6, r7
HALT
