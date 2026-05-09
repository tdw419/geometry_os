; DESCRIPTION: Composite: Draws a magenta circle centered at (331, 84) with radius 42 then Sets a single red pixel at (31, 105).
; PLAN: r0=331(x), r1=84(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=105(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 84
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 105
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
