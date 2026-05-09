; DESCRIPTION: Composite: Places a magenta 101x67 rectangle at position (67, 5) then Draws a white circle centered at (136, 172) with radius 30 then Draws a magenta line from (255, 178) to (259, 100).
; PLAN: r0=67(x), r1=5(y), r2=101(width), r3=67(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=172(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=255(x1), r11=178(y1), r12=259(x2), r13=100(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 5
LDI r2, 101
LDI r3, 67
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 172
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 255
LDI r11, 178
LDI r12, 259
LDI r13, 100
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
