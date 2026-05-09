; DESCRIPTION: Composite: Creates a orange circular shape at (304, 31) with radius 20 then Draws a yellow rectangle at (324, 20) with width 13 and height 40.
; PLAN: r0=304(x), r1=31(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=20(y), r7=13(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 304
LDI r1, 31
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 20
LDI r7, 13
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
