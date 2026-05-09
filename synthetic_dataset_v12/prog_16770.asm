; DESCRIPTION: Composite: Draws a blue circle centered at (288, 66) with radius 23 then Places a red 74x31 rectangle at position (227, 155).
; PLAN: r0=288(x), r1=66(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=227(x), r6=155(y), r7=74(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 66
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 227
LDI r6, 155
LDI r7, 74
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
