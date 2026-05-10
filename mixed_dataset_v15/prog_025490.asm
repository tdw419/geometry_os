; DESCRIPTION: Composite: Renders a white line between points (296, 191) and (180, 103) then Places a orange 77x40 rectangle at position (392, 153) then Draws a blue circle centered at (65, 156) with radius 48.
; PLAN: r0=296(x1), r1=191(y1), r2=180(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=153(y), r7=77(width), r8=40(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x), r11=156(y), r12=48(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 191
LDI r2, 180
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 153
LDI r7, 77
LDI r8, 40
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 156
LDI r12, 48
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
