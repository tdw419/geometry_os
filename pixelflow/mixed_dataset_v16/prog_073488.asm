; DESCRIPTION: Composite: Places a orange line segment connecting (482, 182) to (313, 72) then Draws a yellow rectangle at (33, 6) with width 118 and height 83.
; PLAN: r0=482(x1), r1=182(y1), r2=313(x2), r3=72(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=6(y), r7=118(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 482
LDI r1, 182
LDI r2, 313
LDI r3, 72
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 6
LDI r7, 118
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
