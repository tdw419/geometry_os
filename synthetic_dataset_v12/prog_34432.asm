; DESCRIPTION: Composite: Draws a orange rectangle at (111, 170) with width 80 and height 41 then Creates a green circular shape at (282, 87) with radius 67.
; PLAN: r0=111(x), r1=170(y), r2=80(width), r3=41(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=282(x), r6=87(y), r7=67(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 111
LDI r1, 170
LDI r2, 80
LDI r3, 41
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 87
LDI r7, 67
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
