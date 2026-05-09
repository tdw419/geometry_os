; DESCRIPTION: Composite: Creates a black rectangular region at (137, 14) spanning 102 by 75 pixels then Draws a magenta circle centered at (433, 71) with radius 46.
; PLAN: r0=137(x), r1=14(y), r2=102(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=433(x), r6=71(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 137
LDI r1, 14
LDI r2, 102
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 71
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
