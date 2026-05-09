; DESCRIPTION: Composite: Places a black dot at position (137, 104) then Places a red circle of radius 58 at center (151, 179).
; PLAN: r0=137(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=151(x), r6=179(y), r7=58(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 151
LDI r6, 179
LDI r7, 58
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
