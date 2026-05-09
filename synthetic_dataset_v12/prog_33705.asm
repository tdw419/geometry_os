; DESCRIPTION: Composite: Places a black dot at position (327, 148) then Places a magenta circle of radius 49 at center (332, 90).
; PLAN: r0=327(x), r1=148(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=332(x), r6=90(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 327
LDI r1, 148
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 332
LDI r6, 90
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
