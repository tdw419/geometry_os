; DESCRIPTION: Composite: Creates a blue circular shape at (362, 94) with radius 66 then Places a black dot at position (67, 147).
; PLAN: r0=362(x), r1=94(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=147(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 94
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 147
LDI r7, 0x000000
PSET r5, r6, r7
HALT
