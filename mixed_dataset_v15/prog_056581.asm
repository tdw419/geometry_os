; DESCRIPTION: Composite: Creates a blue rectangular region at (156, 65) spanning 99 by 102 pixels then Draws a cyan circle centered at (300, 150) with radius 62.
; PLAN: r0=156(x), r1=65(y), r2=99(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=150(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 65
LDI r2, 99
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 150
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
