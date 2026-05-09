; DESCRIPTION: Composite: Places a yellow circle of radius 40 at center (405, 211) then Draws a blue rectangle at (136, 110) with width 110 and height 38.
; PLAN: r0=405(x), r1=211(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=110(y), r7=110(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 211
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 110
LDI r7, 110
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
