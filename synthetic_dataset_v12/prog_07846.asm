; DESCRIPTION: Composite: Renders a black box of size 104x66 starting at (257, 175) then Sets a single green pixel at (232, 81) then Draws a white circle centered at (428, 125) with radius 15.
; PLAN: r0=257(x), r1=175(y), r2=104(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=81(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=428(x), r11=125(y), r12=15(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 257
LDI r1, 175
LDI r2, 104
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 81
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 428
LDI r11, 125
LDI r12, 15
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
