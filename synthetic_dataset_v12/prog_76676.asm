; DESCRIPTION: Composite: Draws a magenta circle centered at (212, 194) with radius 36 then Places a purple dot at position (442, 94).
; PLAN: r0=212(x), r1=194(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=442(x), r6=94(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 212
LDI r1, 194
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 442
LDI r6, 94
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
