; DESCRIPTION: Composite: Draws a purple rectangle at (172, 166) with width 54 and height 90 then Creates a red circular shape at (314, 62) with radius 58.
; PLAN: r0=172(x), r1=166(y), r2=54(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x), r6=62(y), r7=58(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 166
LDI r2, 54
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 62
LDI r7, 58
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
