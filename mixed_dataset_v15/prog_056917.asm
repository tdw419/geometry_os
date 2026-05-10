; DESCRIPTION: Composite: Places a magenta 74x62 rectangle at position (98, 101) then Draws a blue circle centered at (63, 106) with radius 11.
; PLAN: r0=98(x), r1=101(y), r2=74(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=106(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 98
LDI r1, 101
LDI r2, 74
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 106
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
