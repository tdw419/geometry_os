; DESCRIPTION: Composite: Places a green line segment connecting (495, 116) to (170, 198) then Draws a yellow rectangle at (329, 83) with width 120 and height 72.
; PLAN: r0=495(x1), r1=116(y1), r2=170(x2), r3=198(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=83(y), r7=120(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 495
LDI r1, 116
LDI r2, 170
LDI r3, 198
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 83
LDI r7, 120
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
