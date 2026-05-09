; DESCRIPTION: Composite: Places a red line segment connecting (222, 15) to (196, 115) then Draws a black rectangle at (133, 31) with width 99 and height 52 then Places a magenta circle of radius 77 at center (190, 104).
; PLAN: r0=222(x1), r1=15(y1), r2=196(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=31(y), r7=99(width), r8=52(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=190(x), r11=104(y), r12=77(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 222
LDI r1, 15
LDI r2, 196
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 31
LDI r7, 99
LDI r8, 52
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 104
LDI r12, 77
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
