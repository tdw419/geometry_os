; DESCRIPTION: Composite: Draws a yellow rectangle at (105, 148) with width 87 and height 104 then Places a blue circle of radius 13 at center (76, 225).
; PLAN: r0=105(x), r1=148(y), r2=87(width), r3=104(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=225(y), r7=13(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 105
LDI r1, 148
LDI r2, 87
LDI r3, 104
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 225
LDI r7, 13
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
