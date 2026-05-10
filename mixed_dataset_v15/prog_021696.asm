; DESCRIPTION: Composite: Creates a green circular shape at (183, 105) with radius 23 then Renders a blue box of size 56x55 starting at (380, 97) then Draws a yellow line from (150, 255) to (8, 1).
; PLAN: r0=183(x), r1=105(y), r2=23(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=380(x), r6=97(y), r7=56(width), r8=55(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=150(x1), r11=255(y1), r12=8(x2), r13=1(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 105
LDI r2, 23
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 380
LDI r6, 97
LDI r7, 56
LDI r8, 55
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 150
LDI r11, 255
LDI r12, 8
LDI r13, 1
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
