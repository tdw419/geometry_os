; DESCRIPTION: Composite: Sets a single black pixel at (123, 58) then Draws a blue circle centered at (316, 90) with radius 49.
; PLAN: r0=123(x), r1=58(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=316(x), r6=90(y), r7=49(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 123
LDI r1, 58
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 316
LDI r6, 90
LDI r7, 49
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
