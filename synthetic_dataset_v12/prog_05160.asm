; DESCRIPTION: Composite: Creates a red rectangular region at (45, 17) spanning 95 by 93 pixels then Draws a white circle centered at (188, 75) with radius 55.
; PLAN: r0=45(x), r1=17(y), r2=95(width), r3=93(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=188(x), r6=75(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 45
LDI r1, 17
LDI r2, 95
LDI r3, 93
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 188
LDI r6, 75
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
