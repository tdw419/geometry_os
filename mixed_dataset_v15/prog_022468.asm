; DESCRIPTION: Composite: Draws a black rectangle at (206, 78) with width 96 and height 93 then Creates a cyan circular shape at (203, 133) with radius 13.
; PLAN: r0=206(x), r1=78(y), r2=96(width), r3=93(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=133(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 206
LDI r1, 78
LDI r2, 96
LDI r3, 93
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 133
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
