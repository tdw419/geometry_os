; DESCRIPTION: Composite: Draws a purple rectangle at (96, 9) with width 20 and height 120 then Renders a blue disk with center (489, 136) and radius 19 then Sets a single blue pixel at (442, 131).
; PLAN: r0=96(x), r1=9(y), r2=20(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=489(x), r6=136(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=442(x), r11=131(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 96
LDI r1, 9
LDI r2, 20
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 489
LDI r6, 136
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 442
LDI r11, 131
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
