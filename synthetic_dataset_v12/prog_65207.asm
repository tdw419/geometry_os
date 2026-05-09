; DESCRIPTION: Composite: Draws a red rectangle at (68, 85) with width 101 and height 12 then Creates a yellow circular shape at (231, 109) with radius 14.
; PLAN: r0=68(x), r1=85(y), r2=101(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=109(y), r7=14(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 85
LDI r2, 101
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 109
LDI r7, 14
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
