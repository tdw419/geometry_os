; DESCRIPTION: Composite: Places a purple line segment connecting (255, 160) to (288, 22) then Draws a magenta rectangle at (175, 131) with width 117 and height 102.
; PLAN: r0=255(x1), r1=160(y1), r2=288(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=131(y), r7=117(width), r8=102(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 160
LDI r2, 288
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 131
LDI r7, 117
LDI r8, 102
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
