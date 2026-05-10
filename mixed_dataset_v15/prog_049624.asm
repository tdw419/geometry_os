; DESCRIPTION: Composite: Draws a white circle centered at (200, 130) with radius 65 then Draws a green rectangle at (314, 167) with width 114 and height 41 then Sets a single green pixel at (92, 98).
; PLAN: r0=200(x), r1=130(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=167(y), r7=114(width), r8=41(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x), r11=98(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 200
LDI r1, 130
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 167
LDI r7, 114
LDI r8, 41
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 98
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
