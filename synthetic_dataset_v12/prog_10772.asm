; DESCRIPTION: Composite: Creates a red circular shape at (52, 69) with radius 30 then Draws a green rectangle at (270, 128) with width 37 and height 114.
; PLAN: r0=52(x), r1=69(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=128(y), r7=37(width), r8=114(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 69
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 128
LDI r7, 37
LDI r8, 114
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
