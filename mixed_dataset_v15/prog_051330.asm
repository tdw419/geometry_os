; DESCRIPTION: Composite: Creates a orange rectangular region at (435, 75) spanning 61 by 53 pixels then Draws a orange circle centered at (324, 162) with radius 80.
; PLAN: r0=435(x), r1=75(y), r2=61(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=162(y), r7=80(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 75
LDI r2, 61
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 162
LDI r7, 80
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
