; DESCRIPTION: Composite: Draws a magenta rectangle at (288, 142) with width 84 and height 109 then Places a cyan dot at position (388, 109) then Renders a black disk with center (195, 169) and radius 78.
; PLAN: r0=288(x), r1=142(y), r2=84(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=388(x), r6=109(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=195(x), r11=169(y), r12=78(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 288
LDI r1, 142
LDI r2, 84
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 109
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 195
LDI r11, 169
LDI r12, 78
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
