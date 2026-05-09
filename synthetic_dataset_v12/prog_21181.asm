; DESCRIPTION: Composite: Creates a red circular shape at (462, 138) with radius 23 then Renders a blue box of size 11x25 starting at (225, 104) then Draws a orange line from (331, 160) to (339, 152).
; PLAN: r0=462(x), r1=138(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=104(y), r7=11(width), r8=25(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=160(y1), r12=339(x2), r13=152(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 462
LDI r1, 138
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 104
LDI r7, 11
LDI r8, 25
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 160
LDI r12, 339
LDI r13, 152
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
