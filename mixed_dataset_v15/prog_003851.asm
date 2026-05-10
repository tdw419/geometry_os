; DESCRIPTION: Composite: Draws a black circle centered at (451, 144) with radius 21 then Places a red dot at position (85, 73) then Draws a black rectangle at (24, 130) with width 91 and height 99.
; PLAN: r0=451(x), r1=144(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=73(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=24(x), r11=130(y), r12=91(width), r13=99(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 144
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 73
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 24
LDI r11, 130
LDI r12, 91
LDI r13, 99
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
