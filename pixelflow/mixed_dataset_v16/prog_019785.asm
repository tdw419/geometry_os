; DESCRIPTION: Composite: Draws a orange circle centered at (438, 88) with radius 71 then Draws a black rectangle at (96, 57) with width 16 and height 86.
; PLAN: r0=438(x), r1=88(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=96(x), r6=57(y), r7=16(width), r8=86(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 88
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 96
LDI r6, 57
LDI r7, 16
LDI r8, 86
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
