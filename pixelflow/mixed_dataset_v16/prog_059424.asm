; DESCRIPTION: Composite: Creates a green rectangular region at (109, 19) spanning 31 by 100 pixels then Draws a magenta circle centered at (376, 166) with radius 59.
; PLAN: r0=109(x), r1=19(y), r2=31(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=166(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 109
LDI r1, 19
LDI r2, 31
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 166
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
