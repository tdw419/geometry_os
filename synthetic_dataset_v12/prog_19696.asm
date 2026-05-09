; DESCRIPTION: Composite: Draws a purple circle centered at (363, 136) with radius 67 then Creates a magenta rectangular region at (329, 10) spanning 64 by 113 pixels.
; PLAN: r0=363(x), r1=136(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=10(y), r7=64(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 136
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 10
LDI r7, 64
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
