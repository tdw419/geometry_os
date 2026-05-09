; DESCRIPTION: Composite: Sets a single yellow pixel at (98, 106) then Draws a white rectangle at (88, 65) with width 23 and height 96 then Draws a black circle centered at (134, 166) with radius 10.
; PLAN: r0=98(x), r1=106(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=88(x), r6=65(y), r7=23(width), r8=96(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=166(y), r12=10(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 98
LDI r1, 106
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 88
LDI r6, 65
LDI r7, 23
LDI r8, 96
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 166
LDI r12, 10
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
