; DESCRIPTION: Composite: Places a black line segment connecting (104, 131) to (303, 140) then Draws a white circle centered at (255, 125) with radius 62 then Places a black 65x27 rectangle at position (258, 58).
; PLAN: r0=104(x1), r1=131(y1), r2=303(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=125(y), r7=62(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x), r11=58(y), r12=65(width), r13=27(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 131
LDI r2, 303
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 125
LDI r7, 62
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 58
LDI r12, 65
LDI r13, 27
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
