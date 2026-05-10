; DESCRIPTION: Composite: Places a purple circle of radius 66 at center (136, 190) then Draws a cyan rectangle at (162, 82) with width 18 and height 79 then Places a black line segment connecting (280, 112) to (261, 227).
; PLAN: r0=136(x), r1=190(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=162(x), r6=82(y), r7=18(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=280(x1), r11=112(y1), r12=261(x2), r13=227(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 190
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 162
LDI r6, 82
LDI r7, 18
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 112
LDI r12, 261
LDI r13, 227
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
