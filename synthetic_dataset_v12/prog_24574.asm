; DESCRIPTION: Composite: Draws a black circle centered at (54, 112) with radius 26 then Places a magenta 73x49 rectangle at position (332, 101).
; PLAN: r0=54(x), r1=112(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x), r6=101(y), r7=73(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 112
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 101
LDI r7, 73
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
