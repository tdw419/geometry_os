; DESCRIPTION: Composite: Renders a orange line between points (473, 21) and (62, 118) then Places a white dot at position (310, 18) then Draws a purple rectangle at (334, 97) with width 11 and height 16.
; PLAN: r0=473(x1), r1=21(y1), r2=62(x2), r3=118(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=18(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=334(x), r11=97(y), r12=11(width), r13=16(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 473
LDI r1, 21
LDI r2, 62
LDI r3, 118
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 18
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 334
LDI r11, 97
LDI r12, 11
LDI r13, 16
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
