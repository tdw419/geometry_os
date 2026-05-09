; DESCRIPTION: Composite: Draws a purple rectangle at (109, 42) with width 66 and height 16 then Places a blue dot at position (473, 122) then Draws a black circle centered at (143, 44) with radius 39.
; PLAN: r0=109(x), r1=42(y), r2=66(width), r3=16(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=473(x), r6=122(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=44(y), r12=39(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 109
LDI r1, 42
LDI r2, 66
LDI r3, 16
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 122
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 143
LDI r11, 44
LDI r12, 39
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
