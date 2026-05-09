; DESCRIPTION: Composite: Renders a green line between points (283, 132) and (481, 174) then Draws a green rectangle at (3, 76) with width 94 and height 12 then Creates a orange circular shape at (155, 168) with radius 35.
; PLAN: r0=283(x1), r1=132(y1), r2=481(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=76(y), r7=94(width), r8=12(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=155(x), r11=168(y), r12=35(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 132
LDI r2, 481
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 76
LDI r7, 94
LDI r8, 12
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 168
LDI r12, 35
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
