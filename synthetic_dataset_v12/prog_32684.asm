; DESCRIPTION: Composite: Places a purple circle of radius 45 at center (247, 187) then Places a blue dot at position (11, 21) then Draws a blue rectangle at (9, 123) with width 93 and height 65.
; PLAN: r0=247(x), r1=187(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=21(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=9(x), r11=123(y), r12=93(width), r13=65(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 247
LDI r1, 187
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 21
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 9
LDI r11, 123
LDI r12, 93
LDI r13, 65
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
