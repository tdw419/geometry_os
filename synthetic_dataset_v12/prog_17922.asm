; DESCRIPTION: Composite: Draws a white circle centered at (244, 125) with radius 39 then Creates a white rectangular region at (3, 55) spanning 117 by 104 pixels.
; PLAN: r0=244(x), r1=125(y), r2=39(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=3(x), r6=55(y), r7=117(width), r8=104(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 125
LDI r2, 39
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 3
LDI r6, 55
LDI r7, 117
LDI r8, 104
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
