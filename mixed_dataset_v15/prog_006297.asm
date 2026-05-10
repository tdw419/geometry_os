; DESCRIPTION: Composite: Draws a red rectangle at (229, 147) with width 69 and height 81 then Sets a single black pixel at (383, 34) then Places a yellow line segment connecting (237, 34) to (159, 81).
; PLAN: r0=229(x), r1=147(y), r2=69(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=34(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=237(x1), r11=34(y1), r12=159(x2), r13=81(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 147
LDI r2, 69
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 34
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 237
LDI r11, 34
LDI r12, 159
LDI r13, 81
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
