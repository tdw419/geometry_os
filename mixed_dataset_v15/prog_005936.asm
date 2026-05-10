; DESCRIPTION: Composite: Draws a cyan rectangle at (9, 122) with width 68 and height 113 then Creates a cyan circular shape at (93, 95) with radius 56.
; PLAN: r0=9(x), r1=122(y), r2=68(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=95(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 122
LDI r2, 68
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 95
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
