; DESCRIPTION: Composite: Draws a white rectangle at (192, 90) with width 114 and height 16 then Draws a yellow circle centered at (64, 165) with radius 39.
; PLAN: r0=192(x), r1=90(y), r2=114(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=64(x), r6=165(y), r7=39(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 192
LDI r1, 90
LDI r2, 114
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 165
LDI r7, 39
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
