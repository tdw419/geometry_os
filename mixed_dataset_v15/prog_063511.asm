; DESCRIPTION: Composite: Creates a purple rectangular region at (226, 102) spanning 16 by 61 pixels then Draws a blue circle centered at (169, 101) with radius 69.
; PLAN: r0=226(x), r1=102(y), r2=16(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x), r6=101(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 226
LDI r1, 102
LDI r2, 16
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 101
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
