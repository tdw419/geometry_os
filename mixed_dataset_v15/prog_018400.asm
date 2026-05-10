; DESCRIPTION: Composite: Draws a cyan rectangle at (430, 156) with width 17 and height 96 then Sets a single purple pixel at (198, 195) then Renders a magenta line between points (486, 138) and (249, 206).
; PLAN: r0=430(x), r1=156(y), r2=17(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=198(x), r6=195(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=486(x1), r11=138(y1), r12=249(x2), r13=206(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 156
LDI r2, 17
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 195
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 486
LDI r11, 138
LDI r12, 249
LDI r13, 206
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
