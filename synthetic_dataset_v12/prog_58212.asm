; DESCRIPTION: Composite: Creates a green rectangular region at (61, 96) spanning 86 by 66 pixels then Draws a green circle centered at (218, 99) with radius 79.
; PLAN: r0=61(x), r1=96(y), r2=86(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=218(x), r6=99(y), r7=79(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 96
LDI r2, 86
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 218
LDI r6, 99
LDI r7, 79
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
