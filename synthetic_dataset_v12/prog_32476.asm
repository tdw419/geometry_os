; DESCRIPTION: Composite: Creates a red rectangular region at (205, 154) spanning 93 by 72 pixels then Draws a blue circle centered at (90, 216) with radius 20.
; PLAN: r0=205(x), r1=154(y), r2=93(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=216(y), r7=20(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 205
LDI r1, 154
LDI r2, 93
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 216
LDI r7, 20
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
