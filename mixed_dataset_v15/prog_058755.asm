; DESCRIPTION: Composite: Draws a white rectangle at (172, 70) with width 67 and height 59 then Creates a cyan circular shape at (189, 156) with radius 52.
; PLAN: r0=172(x), r1=70(y), r2=67(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=156(y), r7=52(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 70
LDI r2, 67
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 156
LDI r7, 52
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
