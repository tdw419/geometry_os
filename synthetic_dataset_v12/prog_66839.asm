; DESCRIPTION: Composite: Sets a single black pixel at (120, 254) then Draws a magenta circle centered at (255, 119) with radius 15.
; PLAN: r0=120(x), r1=254(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=119(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 120
LDI r1, 254
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 255
LDI r6, 119
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
