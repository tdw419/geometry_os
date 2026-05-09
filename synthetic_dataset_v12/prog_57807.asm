; DESCRIPTION: Composite: Creates a orange circular shape at (301, 183) with radius 38 then Draws a white rectangle at (326, 161) with width 49 and height 84.
; PLAN: r0=301(x), r1=183(y), r2=38(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=161(y), r7=49(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 301
LDI r1, 183
LDI r2, 38
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 161
LDI r7, 49
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
