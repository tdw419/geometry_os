; DESCRIPTION: Composite: Draws a yellow circle centered at (339, 126) with radius 18 then Draws a green rectangle at (85, 135) with width 33 and height 93.
; PLAN: r0=339(x), r1=126(y), r2=18(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=135(y), r7=33(width), r8=93(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 339
LDI r1, 126
LDI r2, 18
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 135
LDI r7, 33
LDI r8, 93
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
