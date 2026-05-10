; DESCRIPTION: Composite: Sets a single black pixel at (400, 167) then Draws a yellow circle centered at (400, 128) with radius 20.
; PLAN: r0=400(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=128(y), r7=20(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 400
LDI r6, 128
LDI r7, 20
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
