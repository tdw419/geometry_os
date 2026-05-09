; DESCRIPTION: Composite: Draws a purple circle centered at (437, 61) with radius 25 then Draws a magenta rectangle at (353, 54) with width 101 and height 113.
; PLAN: r0=437(x), r1=61(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=54(y), r7=101(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 61
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 54
LDI r7, 101
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
