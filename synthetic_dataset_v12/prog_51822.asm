; DESCRIPTION: Composite: Places a purple dot at position (373, 16) then Creates a orange circular shape at (415, 104) with radius 72.
; PLAN: r0=373(x), r1=16(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=104(y), r7=72(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 373
LDI r1, 16
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 415
LDI r6, 104
LDI r7, 72
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
