; DESCRIPTION: Composite: Draws a blue rectangle at (65, 142) with width 57 and height 15 then Sets a single white pixel at (391, 112) then Creates a blue circular shape at (347, 100) with radius 26.
; PLAN: r0=65(x), r1=142(y), r2=57(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=347(x), r11=100(y), r12=26(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 142
LDI r2, 57
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 347
LDI r11, 100
LDI r12, 26
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
