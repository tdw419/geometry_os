; DESCRIPTION: Composite: Places a orange dot at position (488, 4) then Draws a magenta rectangle at (250, 149) with width 42 and height 79 then Creates a blue circular shape at (455, 97) with radius 25.
; PLAN: r0=488(x), r1=4(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=149(y), r7=42(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=455(x), r11=97(y), r12=25(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 488
LDI r1, 4
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 250
LDI r6, 149
LDI r7, 42
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 97
LDI r12, 25
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
