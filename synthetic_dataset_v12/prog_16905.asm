; DESCRIPTION: Composite: Creates a yellow circular shape at (396, 135) with radius 17 then Draws a white rectangle at (354, 16) with width 97 and height 82.
; PLAN: r0=396(x), r1=135(y), r2=17(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x), r6=16(y), r7=97(width), r8=82(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 135
LDI r2, 17
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 16
LDI r7, 97
LDI r8, 82
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
