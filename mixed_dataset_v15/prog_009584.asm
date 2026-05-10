; DESCRIPTION: Composite: Creates a purple rectangular region at (424, 100) spanning 38 by 69 pixels then Renders a purple disk with center (344, 131) and radius 68.
; PLAN: r0=424(x), r1=100(y), r2=38(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x), r6=131(y), r7=68(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 424
LDI r1, 100
LDI r2, 38
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 131
LDI r7, 68
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
