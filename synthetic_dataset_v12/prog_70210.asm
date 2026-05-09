; DESCRIPTION: Composite: Draws a magenta circle centered at (271, 104) with radius 75 then Places a black dot at position (80, 20).
; PLAN: r0=271(x), r1=104(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=20(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 104
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 20
LDI r7, 0x000000
PSET r5, r6, r7
HALT
