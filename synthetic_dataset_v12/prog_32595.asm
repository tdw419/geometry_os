; DESCRIPTION: Composite: Draws a white circle centered at (412, 104) with radius 44 then Places a green dot at position (109, 143).
; PLAN: r0=412(x), r1=104(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=143(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 104
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 143
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
