; DESCRIPTION: Composite: Draws a orange rectangle at (42, 14) with width 117 and height 120 then Places a blue circle of radius 74 at center (375, 107) then Renders a orange line between points (408, 96) and (260, 155).
; PLAN: r0=42(x), r1=14(y), r2=117(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=375(x), r6=107(y), r7=74(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=408(x1), r11=96(y1), r12=260(x2), r13=155(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 42
LDI r1, 14
LDI r2, 117
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 375
LDI r6, 107
LDI r7, 74
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 408
LDI r11, 96
LDI r12, 260
LDI r13, 155
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
