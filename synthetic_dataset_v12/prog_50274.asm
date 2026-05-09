; DESCRIPTION: Composite: Draws a blue rectangle at (396, 1) with width 100 and height 82 then Creates a blue circular shape at (427, 109) with radius 58 then Places a purple dot at position (505, 42).
; PLAN: r0=396(x), r1=1(y), r2=100(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=109(y), r7=58(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=505(x), r11=42(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 1
LDI r2, 100
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 109
LDI r7, 58
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 505
LDI r11, 42
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
