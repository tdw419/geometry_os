; DESCRIPTION: Composite: Draws a magenta rectangle at (138, 113) with width 25 and height 104 then Places a red dot at position (122, 176) then Places a blue circle of radius 10 at center (107, 183).
; PLAN: r0=138(x), r1=113(y), r2=25(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=176(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=107(x), r11=183(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 138
LDI r1, 113
LDI r2, 25
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 176
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 107
LDI r11, 183
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
