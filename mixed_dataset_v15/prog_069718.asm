; DESCRIPTION: Composite: Draws a green circle centered at (375, 114) with radius 79 then Places a cyan dot at position (201, 182).
; PLAN: r0=375(x), r1=114(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=201(x), r6=182(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 375
LDI r1, 114
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 201
LDI r6, 182
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
