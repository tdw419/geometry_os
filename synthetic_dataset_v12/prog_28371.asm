; DESCRIPTION: Composite: Creates a black rectangular region at (449, 93) spanning 47 by 104 pixels then Draws a white circle centered at (316, 180) with radius 70.
; PLAN: r0=449(x), r1=93(y), r2=47(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=180(y), r7=70(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 449
LDI r1, 93
LDI r2, 47
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 180
LDI r7, 70
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
