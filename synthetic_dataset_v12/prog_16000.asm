; DESCRIPTION: Composite: Creates a white circular shape at (344, 105) with radius 71 then Draws a cyan rectangle at (132, 203) with width 50 and height 22.
; PLAN: r0=344(x), r1=105(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=203(y), r7=50(width), r8=22(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 105
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 203
LDI r7, 50
LDI r8, 22
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
