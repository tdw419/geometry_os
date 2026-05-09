; DESCRIPTION: Composite: Sets a single blue pixel at (198, 90) then Draws a white circle centered at (260, 81) with radius 76.
; PLAN: r0=198(x), r1=90(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=81(y), r7=76(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 90
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 260
LDI r6, 81
LDI r7, 76
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
