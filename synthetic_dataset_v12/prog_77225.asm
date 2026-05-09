; DESCRIPTION: Composite: Renders a black box of size 66x26 starting at (163, 222) then Places a purple dot at position (344, 181) then Draws a orange circle centered at (416, 225) with radius 20.
; PLAN: r0=163(x), r1=222(y), r2=66(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=181(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=416(x), r11=225(y), r12=20(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 222
LDI r2, 66
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 181
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 416
LDI r11, 225
LDI r12, 20
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
