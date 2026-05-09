; DESCRIPTION: Composite: Places a orange dot at position (178, 96) then Renders a purple box of size 73x63 starting at (296, 1) then Draws a yellow circle centered at (114, 149) with radius 69.
; PLAN: r0=178(x), r1=96(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=296(x), r6=1(y), r7=73(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=114(x), r11=149(y), r12=69(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 178
LDI r1, 96
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 296
LDI r6, 1
LDI r7, 73
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 149
LDI r12, 69
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
