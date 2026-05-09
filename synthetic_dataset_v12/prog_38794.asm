; DESCRIPTION: Composite: Draws a red rectangle at (142, 101) with width 44 and height 74 then Creates a black circular shape at (382, 20) with radius 15 then Places a orange dot at position (313, 6).
; PLAN: r0=142(x), r1=101(y), r2=44(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=382(x), r6=20(y), r7=15(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=313(x), r11=6(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 142
LDI r1, 101
LDI r2, 44
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 382
LDI r6, 20
LDI r7, 15
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 313
LDI r11, 6
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
