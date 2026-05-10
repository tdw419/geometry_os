; DESCRIPTION: Composite: Creates a magenta rectangular region at (9, 146) spanning 51 by 97 pixels then Draws a purple circle centered at (366, 175) with radius 58 then Places a green dot at position (390, 80).
; PLAN: r0=9(x), r1=146(y), r2=51(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=175(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=390(x), r11=80(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 9
LDI r1, 146
LDI r2, 51
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 175
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 390
LDI r11, 80
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
