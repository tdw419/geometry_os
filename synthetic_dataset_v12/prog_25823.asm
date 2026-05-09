; DESCRIPTION: Composite: Sets a single yellow pixel at (24, 154) then Places a purple line segment connecting (233, 236) to (43, 40) then Draws a black rectangle at (170, 134) with width 65 and height 51.
; PLAN: r0=24(x), r1=154(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=233(x1), r6=236(y1), r7=43(x2), r8=40(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=170(x), r11=134(y), r12=65(width), r13=51(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 154
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 233
LDI r6, 236
LDI r7, 43
LDI r8, 40
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 134
LDI r12, 65
LDI r13, 51
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
