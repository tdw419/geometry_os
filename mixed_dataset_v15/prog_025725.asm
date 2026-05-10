; DESCRIPTION: Composite: Places a orange line segment connecting (486, 96) to (218, 108) then Draws a green rectangle at (261, 100) with width 101 and height 81.
; PLAN: r0=486(x1), r1=96(y1), r2=218(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=100(y), r7=101(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 486
LDI r1, 96
LDI r2, 218
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 100
LDI r7, 101
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
