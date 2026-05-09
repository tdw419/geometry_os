; DESCRIPTION: Composite: Creates a orange rectangular region at (158, 72) spanning 69 by 87 pixels then Draws a green circle centered at (224, 131) with radius 46.
; PLAN: r0=158(x), r1=72(y), r2=69(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=224(x), r6=131(y), r7=46(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 158
LDI r1, 72
LDI r2, 69
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 131
LDI r7, 46
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
