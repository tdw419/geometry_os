; DESCRIPTION: Composite: Places a white circle of radius 29 at center (127, 104) then Places a yellow line segment connecting (344, 158) to (369, 233) then Places a magenta 83x63 rectangle at position (365, 89).
; PLAN: r0=127(x), r1=104(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x1), r6=158(y1), r7=369(x2), r8=233(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=365(x), r11=89(y), r12=83(width), r13=63(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 104
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 158
LDI r7, 369
LDI r8, 233
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 89
LDI r12, 83
LDI r13, 63
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
