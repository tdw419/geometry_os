; DESCRIPTION: Composite: Draws a cyan circle centered at (119, 40) with radius 15 then Draws a orange rectangle at (430, 98) with width 58 and height 88.
; PLAN: r0=119(x), r1=40(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=430(x), r6=98(y), r7=58(width), r8=88(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 119
LDI r1, 40
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 430
LDI r6, 98
LDI r7, 58
LDI r8, 88
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
