; DESCRIPTION: Composite: Draws a blue rectangle at (97, 172) with width 15 and height 75 then Places a green circle of radius 66 at center (426, 128).
; PLAN: r0=97(x), r1=172(y), r2=15(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=426(x), r6=128(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 97
LDI r1, 172
LDI r2, 15
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 128
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
