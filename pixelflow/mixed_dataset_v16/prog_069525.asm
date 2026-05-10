; DESCRIPTION: Composite: Draws a green circle centered at (104, 90) with radius 23 then Places a cyan dot at position (114, 196).
; PLAN: r0=104(x), r1=90(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=114(x), r6=196(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 104
LDI r1, 90
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 114
LDI r6, 196
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
