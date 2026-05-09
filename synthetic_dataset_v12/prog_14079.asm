; DESCRIPTION: Composite: Draws a purple rectangle at (193, 67) with width 25 and height 120 then Renders a purple disk with center (84, 75) and radius 26 then Sets a single blue pixel at (322, 142).
; PLAN: r0=193(x), r1=67(y), r2=25(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=75(y), r7=26(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=322(x), r11=142(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 193
LDI r1, 67
LDI r2, 25
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 75
LDI r7, 26
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 322
LDI r11, 142
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
