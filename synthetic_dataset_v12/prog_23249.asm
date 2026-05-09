; DESCRIPTION: Composite: Creates a white circular shape at (355, 25) with radius 15 then Draws a orange rectangle at (344, 101) with width 92 and height 96.
; PLAN: r0=355(x), r1=25(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=101(y), r7=92(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 25
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 101
LDI r7, 92
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
