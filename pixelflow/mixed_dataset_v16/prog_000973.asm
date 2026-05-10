; DESCRIPTION: Composite: Creates a orange circular shape at (303, 104) with radius 18 then Draws a black rectangle at (457, 157) with width 18 and height 75.
; PLAN: r0=303(x), r1=104(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x), r6=157(y), r7=18(width), r8=75(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 303
LDI r1, 104
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 157
LDI r7, 18
LDI r8, 75
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
