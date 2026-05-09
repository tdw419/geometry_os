; DESCRIPTION: Composite: Creates a cyan circular shape at (369, 203) with radius 52 then Draws a cyan rectangle at (357, 143) with width 44 and height 54.
; PLAN: r0=369(x), r1=203(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x), r6=143(y), r7=44(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 369
LDI r1, 203
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 143
LDI r7, 44
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
