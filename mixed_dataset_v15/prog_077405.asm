; DESCRIPTION: Composite: Sets a single black pixel at (195, 167) then Draws a purple circle centered at (271, 103) with radius 57.
; PLAN: r0=195(x), r1=167(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=271(x), r6=103(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 167
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 271
LDI r6, 103
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
