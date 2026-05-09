; DESCRIPTION: Composite: Creates a blue circular shape at (344, 233) with radius 13 then Renders a orange line between points (160, 154) and (187, 38) then Draws a orange rectangle at (382, 55) with width 57 and height 22.
; PLAN: r0=344(x), r1=233(y), r2=13(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=160(x1), r6=154(y1), r7=187(x2), r8=38(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=55(y), r12=57(width), r13=22(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 344
LDI r1, 233
LDI r2, 13
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 160
LDI r6, 154
LDI r7, 187
LDI r8, 38
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 55
LDI r12, 57
LDI r13, 22
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
