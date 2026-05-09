; DESCRIPTION: Composite: Draws a purple rectangle at (156, 134) with width 97 and height 63 then Renders a white disk with center (119, 122) and radius 75 then Sets a single white pixel at (183, 44).
; PLAN: r0=156(x), r1=134(y), r2=97(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=119(x), r6=122(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=183(x), r11=44(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 134
LDI r2, 97
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 122
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 183
LDI r11, 44
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
