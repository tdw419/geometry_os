; DESCRIPTION: Composite: Draws a red circle centered at (96, 191) with radius 53 then Places a red 11x112 rectangle at position (163, 127).
; PLAN: r0=96(x), r1=191(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=163(x), r6=127(y), r7=11(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 191
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 163
LDI r6, 127
LDI r7, 11
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
