; DESCRIPTION: Composite: Draws a blue line from (152, 40) to (447, 76) then Places a orange 82x118 rectangle at position (152, 6) then Renders a blue disk with center (413, 91) and radius 18.
; PLAN: r0=152(x1), r1=40(y1), r2=447(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=6(y), r7=82(width), r8=118(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=413(x), r11=91(y), r12=18(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 40
LDI r2, 447
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 6
LDI r7, 82
LDI r8, 118
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 413
LDI r11, 91
LDI r12, 18
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
