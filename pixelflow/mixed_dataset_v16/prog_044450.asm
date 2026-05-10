; DESCRIPTION: Composite: Draws a white rectangle at (269, 163) with width 65 and height 15 then Creates a cyan circular shape at (413, 203) with radius 14.
; PLAN: r0=269(x), r1=163(y), r2=65(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=413(x), r6=203(y), r7=14(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 269
LDI r1, 163
LDI r2, 65
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 413
LDI r6, 203
LDI r7, 14
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
