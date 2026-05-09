; DESCRIPTION: Composite: Draws a orange circle centered at (378, 131) with radius 67 then Places a black 115x104 rectangle at position (267, 7).
; PLAN: r0=378(x), r1=131(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=7(y), r7=115(width), r8=104(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 131
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 7
LDI r7, 115
LDI r8, 104
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
