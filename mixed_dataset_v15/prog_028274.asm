; DESCRIPTION: Composite: Renders a orange line between points (34, 240) and (72, 196) then Places a magenta dot at position (375, 8) then Draws a green rectangle at (101, 159) with width 38 and height 40.
; PLAN: r0=34(x1), r1=240(y1), r2=72(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=375(x), r6=8(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=159(y), r12=38(width), r13=40(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 34
LDI r1, 240
LDI r2, 72
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 8
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 101
LDI r11, 159
LDI r12, 38
LDI r13, 40
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
