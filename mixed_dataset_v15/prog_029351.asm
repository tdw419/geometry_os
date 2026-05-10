; DESCRIPTION: Composite: Renders a red line between points (509, 84) and (396, 141) then Places a white circle of radius 14 at center (325, 198) then Places a white 104x109 rectangle at position (280, 23).
; PLAN: r0=509(x1), r1=84(y1), r2=396(x2), r3=141(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=325(x), r6=198(y), r7=14(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=23(y), r12=104(width), r13=109(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 509
LDI r1, 84
LDI r2, 396
LDI r3, 141
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 198
LDI r7, 14
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 23
LDI r12, 104
LDI r13, 109
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
