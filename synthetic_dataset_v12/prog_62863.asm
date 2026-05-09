; DESCRIPTION: Composite: Draws a orange circle centered at (149, 99) with radius 21 then Draws a black rectangle at (35, 118) with width 95 and height 55.
; PLAN: r0=149(x), r1=99(y), r2=21(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=118(y), r7=95(width), r8=55(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 149
LDI r1, 99
LDI r2, 21
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 118
LDI r7, 95
LDI r8, 55
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
