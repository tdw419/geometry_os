; DESCRIPTION: Composite: Draws a black rectangle at (333, 167) with width 26 and height 26 then Sets a single white pixel at (63, 175) then Places a orange circle of radius 80 at center (355, 133).
; PLAN: r0=333(x), r1=167(y), r2=26(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=355(x), r11=133(y), r12=80(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 333
LDI r1, 167
LDI r2, 26
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 355
LDI r11, 133
LDI r12, 80
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
