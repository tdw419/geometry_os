; DESCRIPTION: Composite: Sets a single blue pixel at (306, 63) then Places a yellow circle of radius 37 at center (265, 62).
; PLAN: r0=306(x), r1=63(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=265(x), r6=62(y), r7=37(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 306
LDI r1, 63
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 265
LDI r6, 62
LDI r7, 37
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
