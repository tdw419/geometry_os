; DESCRIPTION: Composite: Sets a single white pixel at (510, 64) then Places a magenta circle of radius 23 at center (144, 130).
; PLAN: r0=510(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=130(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 510
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 144
LDI r6, 130
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
