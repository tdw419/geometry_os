; DESCRIPTION: Composite: Draws a white rectangle at (339, 93) with width 102 and height 38 then Creates a blue circular shape at (167, 97) with radius 64.
; PLAN: r0=339(x), r1=93(y), r2=102(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=167(x), r6=97(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 339
LDI r1, 93
LDI r2, 102
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 97
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
