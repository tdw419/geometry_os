; DESCRIPTION: Composite: Draws a magenta circle centered at (154, 181) with radius 14 then Creates a white rectangular region at (348, 34) spanning 34 by 104 pixels.
; PLAN: r0=154(x), r1=181(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=348(x), r6=34(y), r7=34(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 181
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 348
LDI r6, 34
LDI r7, 34
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
