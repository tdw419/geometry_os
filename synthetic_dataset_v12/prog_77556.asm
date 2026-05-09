; DESCRIPTION: Composite: Creates a magenta circular shape at (144, 159) with radius 70 then Sets a single white pixel at (338, 118).
; PLAN: r0=144(x), r1=159(y), r2=70(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=118(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 144
LDI r1, 159
LDI r2, 70
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 118
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
