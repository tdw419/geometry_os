; DESCRIPTION: Composite: Sets a single blue pixel at (175, 155) then Draws a blue rectangle at (124, 76) with width 43 and height 106 then Renders a blue disk with center (125, 218) and radius 12.
; PLAN: r0=175(x), r1=155(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=124(x), r6=76(y), r7=43(width), r8=106(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=125(x), r11=218(y), r12=12(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 155
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 124
LDI r6, 76
LDI r7, 43
LDI r8, 106
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 218
LDI r12, 12
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
