; DESCRIPTION: Composite: Places a black dot at position (215, 233) then Draws a purple circle centered at (256, 94) with radius 77.
; PLAN: r0=215(x), r1=233(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=256(x), r6=94(y), r7=77(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 215
LDI r1, 233
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 256
LDI r6, 94
LDI r7, 77
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
