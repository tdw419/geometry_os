; DESCRIPTION: Composite: Places a red 104x43 rectangle at position (40, 8) then Draws a black circle centered at (115, 227) with radius 15.
; PLAN: r0=40(x), r1=8(y), r2=104(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=115(x), r6=227(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 40
LDI r1, 8
LDI r2, 104
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 227
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
