; DESCRIPTION: Composite: Renders a orange line between points (68, 237) and (144, 115) then Sets a single black pixel at (97, 120) then Draws a orange rectangle at (442, 50) with width 63 and height 69.
; PLAN: r0=68(x1), r1=237(y1), r2=144(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=97(x), r6=120(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=442(x), r11=50(y), r12=63(width), r13=69(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 237
LDI r2, 144
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 97
LDI r6, 120
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 442
LDI r11, 50
LDI r12, 63
LDI r13, 69
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
