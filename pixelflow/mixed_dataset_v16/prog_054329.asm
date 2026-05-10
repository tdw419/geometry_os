; DESCRIPTION: Composite: Draws a white rectangle at (296, 46) with width 73 and height 51 then Sets a single blue pixel at (84, 115) then Places a purple line segment connecting (128, 103) to (107, 206).
; PLAN: r0=296(x), r1=46(y), r2=73(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=115(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=128(x1), r11=103(y1), r12=107(x2), r13=206(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 46
LDI r2, 73
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 115
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 128
LDI r11, 103
LDI r12, 107
LDI r13, 206
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
