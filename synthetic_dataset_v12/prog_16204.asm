; DESCRIPTION: Composite: Places a orange dot at position (481, 126) then Places a blue circle of radius 62 at center (367, 77) then Draws a magenta rectangle at (8, 227) with width 55 and height 23.
; PLAN: r0=481(x), r1=126(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=77(y), r7=62(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=227(y), r12=55(width), r13=23(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 126
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 367
LDI r6, 77
LDI r7, 62
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 227
LDI r12, 55
LDI r13, 23
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
