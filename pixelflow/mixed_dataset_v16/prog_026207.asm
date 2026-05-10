; DESCRIPTION: Composite: Renders a yellow disk with center (396, 58) and radius 22 then Draws a green rectangle at (256, 42) with width 47 and height 41 then Places a orange line segment connecting (367, 216) to (398, 216).
; PLAN: r0=396(x), r1=58(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=256(x), r6=42(y), r7=47(width), r8=41(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=367(x1), r11=216(y1), r12=398(x2), r13=216(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 58
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 256
LDI r6, 42
LDI r7, 47
LDI r8, 41
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 367
LDI r11, 216
LDI r12, 398
LDI r13, 216
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
