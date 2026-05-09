; DESCRIPTION: Composite: Draws a white rectangle at (263, 89) with width 106 and height 117 then Creates a magenta circular shape at (108, 183) with radius 29.
; PLAN: r0=263(x), r1=89(y), r2=106(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x), r6=183(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 89
LDI r2, 106
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 183
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
