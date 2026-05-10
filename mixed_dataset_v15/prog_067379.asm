; DESCRIPTION: Composite: Places a blue circle of radius 26 at center (441, 227) then Draws a yellow rectangle at (335, 136) with width 70 and height 119.
; PLAN: r0=441(x), r1=227(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=335(x), r6=136(y), r7=70(width), r8=119(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 441
LDI r1, 227
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 335
LDI r6, 136
LDI r7, 70
LDI r8, 119
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
