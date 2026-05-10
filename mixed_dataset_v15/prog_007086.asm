; DESCRIPTION: Composite: Draws a magenta rectangle at (173, 184) with width 94 and height 66 then Creates a white circular shape at (312, 67) with radius 34.
; PLAN: r0=173(x), r1=184(y), r2=94(width), r3=66(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=312(x), r6=67(y), r7=34(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 173
LDI r1, 184
LDI r2, 94
LDI r3, 66
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 67
LDI r7, 34
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
