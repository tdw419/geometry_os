; DESCRIPTION: Composite: Places a orange circle of radius 50 at center (244, 78) then Places a black 117x37 rectangle at position (375, 92) then Draws a green line from (174, 138) to (176, 63).
; PLAN: r0=244(x), r1=78(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=92(y), r7=117(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=174(x1), r11=138(y1), r12=176(x2), r13=63(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 78
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 92
LDI r7, 117
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 138
LDI r12, 176
LDI r13, 63
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
