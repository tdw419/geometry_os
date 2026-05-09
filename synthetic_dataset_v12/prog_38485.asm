; DESCRIPTION: Composite: Sets a single red pixel at (54, 63) then Draws a magenta circle centered at (438, 73) with radius 25.
; PLAN: r0=54(x), r1=63(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=438(x), r6=73(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 63
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 438
LDI r6, 73
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
