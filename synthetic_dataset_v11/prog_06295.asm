; DESCRIPTION: Composite: . Then Draws a blue circle centered at (97, 172) with radius 67. Then Creates a black rectangular region at (153, 14) spanning 75 by 101 pixels.
; PLAN: r0=97(x), r1=172(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=153(x), r1=14(y), r2=75(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (97, 172) with radius 67.
; PLAN: r0=97(x), r1=172(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 172
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a black rectangular region at (153, 14) spanning 75 by 101 pixels.
; PLAN: r0=153(x), r1=14(y), r2=75(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 14
LDI r2, 75
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
