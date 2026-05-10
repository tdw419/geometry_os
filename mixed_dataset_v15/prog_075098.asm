; DESCRIPTION: Composite: Creates a magenta rectangular region at (335, 7) spanning 10 by 53 pixels then Draws a yellow circle centered at (414, 46) with radius 28.
; PLAN: r0=335(x), r1=7(y), r2=10(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=414(x), r6=46(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 335
LDI r1, 7
LDI r2, 10
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 46
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
