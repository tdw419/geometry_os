; DESCRIPTION: Composite: Renders a green line between points (360, 142) and (422, 176) then Places a orange 37x15 rectangle at position (155, 85) then Draws a yellow circle centered at (123, 166) with radius 76.
; PLAN: r0=360(x1), r1=142(y1), r2=422(x2), r3=176(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=155(x), r6=85(y), r7=37(width), r8=15(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=166(y), r12=76(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 142
LDI r2, 422
LDI r3, 176
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 85
LDI r7, 37
LDI r8, 15
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 166
LDI r12, 76
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
