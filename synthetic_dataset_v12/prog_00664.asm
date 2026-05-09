; DESCRIPTION: Composite: Draws a blue rectangle at (368, 162) with width 98 and height 50 then Creates a green circular shape at (440, 49) with radius 22.
; PLAN: r0=368(x), r1=162(y), r2=98(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=49(y), r7=22(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 162
LDI r2, 98
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 49
LDI r7, 22
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
