; DESCRIPTION: Composite: Draws a white line from (278, 225) to (192, 213) then Sets a single black pixel at (221, 211) then Draws a black rectangle at (8, 41) with width 58 and height 63.
; PLAN: r0=278(x1), r1=225(y1), r2=192(x2), r3=213(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=211(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=8(x), r11=41(y), r12=58(width), r13=63(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 225
LDI r2, 192
LDI r3, 213
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 211
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 8
LDI r11, 41
LDI r12, 58
LDI r13, 63
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
