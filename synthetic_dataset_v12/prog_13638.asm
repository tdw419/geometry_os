; DESCRIPTION: Composite: Places a purple 102x63 rectangle at position (7, 159) then Draws a blue circle centered at (65, 238) with radius 15.
; PLAN: r0=7(x), r1=159(y), r2=102(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=65(x), r6=238(y), r7=15(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 7
LDI r1, 159
LDI r2, 102
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 238
LDI r7, 15
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
