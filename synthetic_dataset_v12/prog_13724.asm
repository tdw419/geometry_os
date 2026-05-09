; DESCRIPTION: Composite: Draws a blue circle centered at (382, 151) with radius 26 then Draws a orange rectangle at (125, 11) with width 22 and height 81.
; PLAN: r0=382(x), r1=151(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=125(x), r6=11(y), r7=22(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 151
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 125
LDI r6, 11
LDI r7, 22
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
