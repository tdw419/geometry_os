; DESCRIPTION: Composite: Sets a single red pixel at (269, 198) then Places a black circle of radius 11 at center (195, 136).
; PLAN: r0=269(x), r1=198(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=136(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 269
LDI r1, 198
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 195
LDI r6, 136
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
