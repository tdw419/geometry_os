; DESCRIPTION: Composite: Draws a magenta rectangle at (343, 11) with width 68 and height 13 then Draws a white circle centered at (313, 68) with radius 54.
; PLAN: r0=343(x), r1=11(y), r2=68(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=68(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 343
LDI r1, 11
LDI r2, 68
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 68
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
