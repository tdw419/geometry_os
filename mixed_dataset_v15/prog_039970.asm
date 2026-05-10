; DESCRIPTION: Composite: Places a orange dot at position (222, 166) then Creates a black circular shape at (230, 97) with radius 12 then Draws a purple rectangle at (389, 178) with width 42 and height 71.
; PLAN: r0=222(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=230(x), r6=97(y), r7=12(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=389(x), r11=178(y), r12=42(width), r13=71(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 230
LDI r6, 97
LDI r7, 12
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 389
LDI r11, 178
LDI r12, 42
LDI r13, 71
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
