; DESCRIPTION: Composite: Draws a magenta rectangle at (70, 78) with width 114 and height 115 then Places a green circle of radius 74 at center (156, 123) then Places a yellow dot at position (375, 254).
; PLAN: r0=70(x), r1=78(y), r2=114(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=123(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=375(x), r11=254(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 78
LDI r2, 114
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 123
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 375
LDI r11, 254
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
