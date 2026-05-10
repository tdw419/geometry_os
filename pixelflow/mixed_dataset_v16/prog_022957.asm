; DESCRIPTION: Composite: Places a blue dot at position (60, 54) then Renders a purple disk with center (382, 138) and radius 36 then Draws a orange rectangle at (475, 155) with width 17 and height 22.
; PLAN: r0=60(x), r1=54(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=382(x), r6=138(y), r7=36(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=475(x), r11=155(y), r12=17(width), r13=22(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 60
LDI r1, 54
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 138
LDI r7, 36
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 475
LDI r11, 155
LDI r12, 17
LDI r13, 22
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
