; DESCRIPTION: Composite: Draws a green circle centered at (412, 151) with radius 41 then Draws a red rectangle at (330, 29) with width 105 and height 26 then Sets a single green pixel at (31, 97).
; PLAN: r0=412(x), r1=151(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=29(y), r7=105(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=97(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 151
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 29
LDI r7, 105
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 97
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
