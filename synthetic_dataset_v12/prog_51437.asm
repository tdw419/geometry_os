; DESCRIPTION: Composite: Places a red dot at position (137, 6) then Places a yellow line segment connecting (391, 105) to (254, 201) then Draws a black rectangle at (368, 44) with width 70 and height 101.
; PLAN: r0=137(x), r1=6(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=391(x1), r6=105(y1), r7=254(x2), r8=201(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=44(y), r12=70(width), r13=101(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 137
LDI r1, 6
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 391
LDI r6, 105
LDI r7, 254
LDI r8, 201
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 44
LDI r12, 70
LDI r13, 101
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
