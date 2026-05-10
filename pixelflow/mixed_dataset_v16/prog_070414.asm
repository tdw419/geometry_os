; DESCRIPTION: Composite: Draws a blue rectangle at (158, 163) with width 84 and height 50 then Draws a yellow line from (55, 71) to (278, 12) then Places a white circle of radius 53 at center (224, 94).
; PLAN: r0=158(x), r1=163(y), r2=84(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x1), r6=71(y1), r7=278(x2), r8=12(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=224(x), r11=94(y), r12=53(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 158
LDI r1, 163
LDI r2, 84
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 71
LDI r7, 278
LDI r8, 12
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 94
LDI r12, 53
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
