; DESCRIPTION: Composite: Renders a green disk with center (78, 79) and radius 71 then Places a black dot at position (105, 84) then Draws a magenta rectangle at (83, 52) with width 32 and height 101.
; PLAN: r0=78(x), r1=79(y), r2=71(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x), r6=84(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=83(x), r11=52(y), r12=32(width), r13=101(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 79
LDI r2, 71
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 84
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 83
LDI r11, 52
LDI r12, 32
LDI r13, 101
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
