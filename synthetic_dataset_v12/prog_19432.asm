; DESCRIPTION: Composite: Draws a blue circle centered at (142, 209) with radius 28 then Places a blue 43x49 rectangle at position (257, 135).
; PLAN: r0=142(x), r1=209(y), r2=28(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=135(y), r7=43(width), r8=49(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 209
LDI r2, 28
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 135
LDI r7, 43
LDI r8, 49
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
