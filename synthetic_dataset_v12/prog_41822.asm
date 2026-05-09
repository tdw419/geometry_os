; DESCRIPTION: Composite: Draws a black rectangle at (269, 4) with width 36 and height 28 then Sets a single orange pixel at (78, 187) then Places a blue circle of radius 24 at center (369, 110).
; PLAN: r0=269(x), r1=4(y), r2=36(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=78(x), r6=187(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=110(y), r12=24(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 269
LDI r1, 4
LDI r2, 36
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 78
LDI r6, 187
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 369
LDI r11, 110
LDI r12, 24
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
