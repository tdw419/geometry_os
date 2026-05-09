; DESCRIPTION: Composite: Sets a single orange pixel at (69, 22) then Draws a red rectangle at (21, 188) with width 74 and height 28 then Creates a orange circular shape at (348, 165) with radius 74.
; PLAN: r0=69(x), r1=22(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=21(x), r6=188(y), r7=74(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=348(x), r11=165(y), r12=74(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 69
LDI r1, 22
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 21
LDI r6, 188
LDI r7, 74
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 348
LDI r11, 165
LDI r12, 74
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
