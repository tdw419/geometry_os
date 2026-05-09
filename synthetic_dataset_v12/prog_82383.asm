; DESCRIPTION: Composite: Draws a blue rectangle at (143, 172) with width 101 and height 62 then Renders a black disk with center (470, 77) and radius 29 then Places a blue dot at position (436, 107).
; PLAN: r0=143(x), r1=172(y), r2=101(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=470(x), r6=77(y), r7=29(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=436(x), r11=107(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 143
LDI r1, 172
LDI r2, 101
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 77
LDI r7, 29
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 436
LDI r11, 107
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
