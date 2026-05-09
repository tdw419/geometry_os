; DESCRIPTION: Composite: Creates a magenta rectangular region at (375, 10) spanning 83 by 99 pixels then Draws a purple circle centered at (270, 186) with radius 68 then Places a blue dot at position (407, 181).
; PLAN: r0=375(x), r1=10(y), r2=83(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=186(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=407(x), r11=181(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 375
LDI r1, 10
LDI r2, 83
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 186
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 407
LDI r11, 181
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
