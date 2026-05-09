; DESCRIPTION: Composite: Creates a green rectangular region at (247, 21) spanning 78 by 65 pixels then Draws a green circle centered at (323, 58) with radius 48.
; PLAN: r0=247(x), r1=21(y), r2=78(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=323(x), r6=58(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 247
LDI r1, 21
LDI r2, 78
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 323
LDI r6, 58
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
