; DESCRIPTION: Composite: Draws a magenta circle centered at (181, 191) with radius 56 then Places a yellow 49x76 rectangle at position (402, 166).
; PLAN: r0=181(x), r1=191(y), r2=56(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=166(y), r7=49(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 181
LDI r1, 191
LDI r2, 56
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 166
LDI r7, 49
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
