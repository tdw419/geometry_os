; DESCRIPTION: Composite: Draws a black rectangle at (10, 59) with width 118 and height 56 then Draws a green circle centered at (156, 149) with radius 36.
; PLAN: r0=10(x), r1=59(y), r2=118(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=149(y), r7=36(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 10
LDI r1, 59
LDI r2, 118
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 149
LDI r7, 36
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
