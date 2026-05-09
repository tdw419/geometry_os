; DESCRIPTION: Composite: Draws a purple rectangle at (138, 99) with width 94 and height 38 then Renders a purple disk with center (270, 181) and radius 65 then Sets a single white pixel at (237, 248).
; PLAN: r0=138(x), r1=99(y), r2=94(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=270(x), r6=181(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=237(x), r11=248(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 99
LDI r2, 94
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 181
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 237
LDI r11, 248
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
