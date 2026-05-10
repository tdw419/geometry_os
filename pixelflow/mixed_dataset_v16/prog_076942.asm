; DESCRIPTION: Composite: Creates a purple rectangular region at (263, 73) spanning 67 by 86 pixels then Draws a orange circle centered at (320, 119) with radius 60.
; PLAN: r0=263(x), r1=73(y), r2=67(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=320(x), r6=119(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 73
LDI r2, 67
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 119
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
