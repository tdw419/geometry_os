; DESCRIPTION: Composite: Draws a purple rectangle at (321, 181) with width 65 and height 72 then Creates a white circular shape at (95, 138) with radius 60 then Places a purple dot at position (148, 36).
; PLAN: r0=321(x), r1=181(y), r2=65(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=138(y), r7=60(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=36(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 321
LDI r1, 181
LDI r2, 65
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 138
LDI r7, 60
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 36
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
