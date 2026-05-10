; DESCRIPTION: Composite: Draws a purple rectangle at (176, 178) with width 114 and height 27 then Creates a blue circular shape at (207, 65) with radius 27.
; PLAN: r0=176(x), r1=178(y), r2=114(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=65(y), r7=27(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 176
LDI r1, 178
LDI r2, 114
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 65
LDI r7, 27
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
