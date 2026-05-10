; DESCRIPTION: Composite: Renders a purple disk with center (429, 183) and radius 43 then Draws a blue rectangle at (49, 109) with width 49 and height 119 then Places a red dot at position (68, 191).
; PLAN: r0=429(x), r1=183(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=109(y), r7=49(width), r8=119(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=191(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 429
LDI r1, 183
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 109
LDI r7, 49
LDI r8, 119
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 191
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
