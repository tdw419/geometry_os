; DESCRIPTION: Composite: Draws a black circle centered at (267, 135) with radius 46 then Draws a magenta rectangle at (265, 33) with width 119 and height 84 then Places a white dot at position (105, 81).
; PLAN: r0=267(x), r1=135(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=33(y), r7=119(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=105(x), r11=81(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 267
LDI r1, 135
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 33
LDI r7, 119
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 81
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
