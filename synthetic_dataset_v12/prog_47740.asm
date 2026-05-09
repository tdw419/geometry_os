; DESCRIPTION: Composite: Draws a magenta circle centered at (177, 137) with radius 34 then Places a green dot at position (207, 96).
; PLAN: r0=177(x), r1=137(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=96(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 137
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 96
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
