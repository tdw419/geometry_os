; DESCRIPTION: Composite: Draws a black circle centered at (418, 90) with radius 33 then Draws a orange rectangle at (375, 132) with width 46 and height 19 then Sets a single magenta pixel at (411, 46).
; PLAN: r0=418(x), r1=90(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=132(y), r7=46(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x), r11=46(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 418
LDI r1, 90
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 132
LDI r7, 46
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 46
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
