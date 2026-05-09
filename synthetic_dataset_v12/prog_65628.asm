; DESCRIPTION: Composite: Renders a purple disk with center (384, 62) and radius 18 then Places a white dot at position (304, 206) then Draws a blue rectangle at (153, 170) with width 82 and height 51.
; PLAN: r0=384(x), r1=62(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=206(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=153(x), r11=170(y), r12=82(width), r13=51(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 62
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 206
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 153
LDI r11, 170
LDI r12, 82
LDI r13, 51
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
