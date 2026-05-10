; DESCRIPTION: Composite: Draws a red circle centered at (71, 81) with radius 68 then Places a white dot at position (111, 69).
; PLAN: r0=71(x), r1=81(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=69(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 81
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 69
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
