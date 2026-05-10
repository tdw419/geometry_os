; DESCRIPTION: Composite: Draws a purple rectangle at (129, 81) with width 19 and height 23 then Renders a blue disk with center (385, 113) and radius 26 then Sets a single purple pixel at (147, 60).
; PLAN: r0=129(x), r1=81(y), r2=19(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=113(y), r7=26(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=147(x), r11=60(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 81
LDI r2, 19
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 113
LDI r7, 26
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 147
LDI r11, 60
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
