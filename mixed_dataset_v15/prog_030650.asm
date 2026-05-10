; DESCRIPTION: Composite: Renders a orange disk with center (244, 34) and radius 32 then Draws a yellow rectangle at (41, 53) with width 97 and height 17.
; PLAN: r0=244(x), r1=34(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=41(x), r6=53(y), r7=97(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 34
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 41
LDI r6, 53
LDI r7, 97
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
