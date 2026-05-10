; DESCRIPTION: Composite: Places a purple dot at position (187, 8) then Creates a blue circular shape at (376, 157) with radius 45 then Draws a purple rectangle at (386, 65) with width 118 and height 47.
; PLAN: r0=187(x), r1=8(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=376(x), r6=157(y), r7=45(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=65(y), r12=118(width), r13=47(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 8
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 376
LDI r6, 157
LDI r7, 45
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 65
LDI r12, 118
LDI r13, 47
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
