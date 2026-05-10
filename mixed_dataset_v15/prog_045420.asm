; DESCRIPTION: Composite: Creates a blue rectangular region at (255, 99) spanning 112 by 106 pixels then Draws a orange circle centered at (110, 85) with radius 67.
; PLAN: r0=255(x), r1=99(y), r2=112(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=85(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 255
LDI r1, 99
LDI r2, 112
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 85
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
