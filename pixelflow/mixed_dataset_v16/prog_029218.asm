; DESCRIPTION: Composite: Draws a yellow circle centered at (86, 179) with radius 52 then Sets a single yellow pixel at (246, 59).
; PLAN: r0=86(x), r1=179(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=246(x), r6=59(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 86
LDI r1, 179
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 246
LDI r6, 59
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
