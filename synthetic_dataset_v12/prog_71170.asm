; DESCRIPTION: Composite: Places a yellow circle of radius 75 at center (130, 104) then Draws a white rectangle at (450, 14) with width 37 and height 114.
; PLAN: r0=130(x), r1=104(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x), r6=14(y), r7=37(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 104
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 14
LDI r7, 37
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
