; DESCRIPTION: Composite: Places a red circle of radius 80 at center (360, 117) then Draws a black rectangle at (110, 114) with width 25 and height 36.
; PLAN: r0=360(x), r1=117(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=110(x), r6=114(y), r7=25(width), r8=36(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 117
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 110
LDI r6, 114
LDI r7, 25
LDI r8, 36
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
