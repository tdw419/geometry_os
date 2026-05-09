; DESCRIPTION: Composite: Draws a magenta line from (91, 171) to (480, 82) then Places a orange circle of radius 54 at center (425, 187) then Draws a black rectangle at (396, 201) with width 53 and height 53.
; PLAN: r0=91(x1), r1=171(y1), r2=480(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=187(y), r7=54(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=201(y), r12=53(width), r13=53(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 91
LDI r1, 171
LDI r2, 480
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 187
LDI r7, 54
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 201
LDI r12, 53
LDI r13, 53
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
