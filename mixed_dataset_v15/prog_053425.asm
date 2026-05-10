; DESCRIPTION: Composite: Draws a black circle centered at (280, 47) with radius 33 then Places a magenta line segment connecting (262, 192) to (129, 29) then Draws a black rectangle at (266, 5) with width 87 and height 60.
; PLAN: r0=280(x), r1=47(y), r2=33(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x1), r6=192(y1), r7=129(x2), r8=29(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=266(x), r11=5(y), r12=87(width), r13=60(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 47
LDI r2, 33
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 192
LDI r7, 129
LDI r8, 29
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 5
LDI r12, 87
LDI r13, 60
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
