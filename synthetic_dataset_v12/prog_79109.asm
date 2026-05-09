; DESCRIPTION: Composite: Places a magenta dot at position (384, 89) then Draws a orange circle centered at (359, 138) with radius 62 then Renders a blue box of size 20x101 starting at (49, 133).
; PLAN: r0=384(x), r1=89(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=359(x), r6=138(y), r7=62(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x), r11=133(y), r12=20(width), r13=101(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 89
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 138
LDI r7, 62
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 133
LDI r12, 20
LDI r13, 101
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
