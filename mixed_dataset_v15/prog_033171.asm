; DESCRIPTION: Composite: Draws a white circle centered at (406, 223) with radius 32 then Draws a green rectangle at (31, 123) with width 53 and height 56.
; PLAN: r0=406(x), r1=223(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=31(x), r6=123(y), r7=53(width), r8=56(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 223
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 31
LDI r6, 123
LDI r7, 53
LDI r8, 56
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
