; DESCRIPTION: Composite: Draws a green rectangle at (79, 125) with width 72 and height 45 then Sets a single red pixel at (21, 123) then Renders a blue line between points (287, 97) and (39, 56).
; PLAN: r0=79(x), r1=125(y), r2=72(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=21(x), r6=123(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=287(x1), r11=97(y1), r12=39(x2), r13=56(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 79
LDI r1, 125
LDI r2, 72
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 21
LDI r6, 123
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 287
LDI r11, 97
LDI r12, 39
LDI r13, 56
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
