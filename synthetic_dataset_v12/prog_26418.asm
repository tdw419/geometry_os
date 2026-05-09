; DESCRIPTION: Composite: Draws a magenta circle centered at (455, 187) with radius 45 then Draws a red line from (51, 58) to (347, 191) then Draws a white rectangle at (74, 49) with width 64 and height 75.
; PLAN: r0=455(x), r1=187(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=51(x1), r6=58(y1), r7=347(x2), r8=191(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=74(x), r11=49(y), r12=64(width), r13=75(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 187
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 51
LDI r6, 58
LDI r7, 347
LDI r8, 191
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 74
LDI r11, 49
LDI r12, 64
LDI r13, 75
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
