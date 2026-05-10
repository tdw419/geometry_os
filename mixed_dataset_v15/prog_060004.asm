; DESCRIPTION: Composite: Draws a magenta circle centered at (312, 25) with radius 15 then Sets a single magenta pixel at (188, 186).
; PLAN: r0=312(x), r1=25(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=188(x), r6=186(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 312
LDI r1, 25
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 188
LDI r6, 186
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
