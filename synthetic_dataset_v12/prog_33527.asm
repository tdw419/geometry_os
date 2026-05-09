; DESCRIPTION: Composite: Places a cyan 20x73 rectangle at position (55, 178) then Sets a single orange pixel at (431, 198) then Draws a magenta circle centered at (130, 76) with radius 55.
; PLAN: r0=55(x), r1=178(y), r2=20(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=431(x), r6=198(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=130(x), r11=76(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 55
LDI r1, 178
LDI r2, 20
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 198
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 130
LDI r11, 76
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
