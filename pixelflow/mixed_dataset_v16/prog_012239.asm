; DESCRIPTION: Composite: Draws a purple rectangle at (440, 52) with width 14 and height 25 then Sets a single cyan pixel at (178, 66) then Renders a black disk with center (49, 134) and radius 16.
; PLAN: r0=440(x), r1=52(y), r2=14(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=178(x), r6=66(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=49(x), r11=134(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 440
LDI r1, 52
LDI r2, 14
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 178
LDI r6, 66
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 49
LDI r11, 134
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
