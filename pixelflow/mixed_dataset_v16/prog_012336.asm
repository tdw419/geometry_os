; DESCRIPTION: Composite: Places a blue dot at position (125, 207) then Renders a black disk with center (157, 165) and radius 37 then Draws a purple rectangle at (344, 142) with width 32 and height 79.
; PLAN: r0=125(x), r1=207(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=157(x), r6=165(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=344(x), r11=142(y), r12=32(width), r13=79(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 207
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 157
LDI r6, 165
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 344
LDI r11, 142
LDI r12, 32
LDI r13, 79
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
