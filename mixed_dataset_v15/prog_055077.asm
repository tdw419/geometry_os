; DESCRIPTION: Composite: Places a blue circle of radius 14 at center (112, 106) then Draws a green line from (495, 175) to (123, 13) then Places a blue 105x101 rectangle at position (218, 25).
; PLAN: r0=112(x), r1=106(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x1), r6=175(y1), r7=123(x2), r8=13(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=218(x), r11=25(y), r12=105(width), r13=101(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 106
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 175
LDI r7, 123
LDI r8, 13
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 218
LDI r11, 25
LDI r12, 105
LDI r13, 101
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
