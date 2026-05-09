; DESCRIPTION: Composite: Draws a black rectangle at (353, 173) with width 58 and height 39 then Creates a green circular shape at (82, 86) with radius 37.
; PLAN: r0=353(x), r1=173(y), r2=58(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=82(x), r6=86(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 353
LDI r1, 173
LDI r2, 58
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 86
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
