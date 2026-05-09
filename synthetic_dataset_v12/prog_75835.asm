; DESCRIPTION: Composite: Renders a black box of size 25x42 starting at (55, 15) then Draws a blue circle centered at (418, 107) with radius 75 then Places a orange line segment connecting (486, 199) to (311, 164).
; PLAN: r0=55(x), r1=15(y), r2=25(width), r3=42(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=418(x), r6=107(y), r7=75(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=486(x1), r11=199(y1), r12=311(x2), r13=164(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 15
LDI r2, 25
LDI r3, 42
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 107
LDI r7, 75
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 486
LDI r11, 199
LDI r12, 311
LDI r13, 164
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
