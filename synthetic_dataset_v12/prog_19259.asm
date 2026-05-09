; DESCRIPTION: Composite: Creates a purple rectangular region at (475, 75) spanning 26 by 118 pixels then Places a orange dot at position (257, 14) then Draws a magenta circle centered at (225, 178) with radius 56.
; PLAN: r0=475(x), r1=75(y), r2=26(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=257(x), r6=14(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=225(x), r11=178(y), r12=56(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 475
LDI r1, 75
LDI r2, 26
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 257
LDI r6, 14
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 225
LDI r11, 178
LDI r12, 56
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
