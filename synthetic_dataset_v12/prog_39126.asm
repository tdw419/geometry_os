; DESCRIPTION: Composite: Draws a red rectangle at (161, 98) with width 12 and height 62 then Draws a black circle centered at (129, 121) with radius 27 then Sets a single black pixel at (303, 240).
; PLAN: r0=161(x), r1=98(y), r2=12(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=121(y), r7=27(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=303(x), r11=240(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 98
LDI r2, 12
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 121
LDI r7, 27
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 303
LDI r11, 240
LDI r12, 0x000000
PSET r10, r11, r12
HALT
