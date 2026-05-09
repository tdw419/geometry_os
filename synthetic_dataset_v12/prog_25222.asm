; DESCRIPTION: Composite: Draws a blue rectangle at (327, 91) with width 19 and height 102 then Places a black dot at position (245, 105) then Creates a purple circular shape at (210, 175) with radius 74.
; PLAN: r0=327(x), r1=91(y), r2=19(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=105(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=210(x), r11=175(y), r12=74(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 327
LDI r1, 91
LDI r2, 19
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 105
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 210
LDI r11, 175
LDI r12, 74
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
