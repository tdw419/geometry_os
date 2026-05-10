; DESCRIPTION: Composite: Places a yellow line segment connecting (197, 162) to (143, 70) then Draws a yellow circle centered at (260, 63) with radius 61 then Draws a cyan rectangle at (85, 85) with width 69 and height 65.
; PLAN: r0=197(x1), r1=162(y1), r2=143(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=63(y), r7=61(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=85(x), r11=85(y), r12=69(width), r13=65(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 162
LDI r2, 143
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 63
LDI r7, 61
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 85
LDI r11, 85
LDI r12, 69
LDI r13, 65
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
