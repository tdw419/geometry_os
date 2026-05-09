; DESCRIPTION: Composite: Places a blue circle of radius 30 at center (352, 154) then Draws a yellow rectangle at (28, 201) with width 24 and height 20.
; PLAN: r0=352(x), r1=154(y), r2=30(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=28(x), r6=201(y), r7=24(width), r8=20(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 352
LDI r1, 154
LDI r2, 30
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 28
LDI r6, 201
LDI r7, 24
LDI r8, 20
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
