; DESCRIPTION: Composite: Places a yellow circle of radius 69 at center (103, 162) then Draws a purple rectangle at (382, 84) with width 57 and height 26.
; PLAN: r0=103(x), r1=162(y), r2=69(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=84(y), r7=57(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 162
LDI r2, 69
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 84
LDI r7, 57
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
