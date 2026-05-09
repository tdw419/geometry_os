; DESCRIPTION: Composite: Draws a orange rectangle at (233, 51) with width 47 and height 63 then Sets a single blue pixel at (35, 178) then Places a black circle of radius 43 at center (156, 77).
; PLAN: r0=233(x), r1=51(y), r2=47(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=178(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=156(x), r11=77(y), r12=43(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 233
LDI r1, 51
LDI r2, 47
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 178
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 156
LDI r11, 77
LDI r12, 43
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
