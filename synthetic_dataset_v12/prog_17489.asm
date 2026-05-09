; DESCRIPTION: Composite: Places a red line segment connecting (249, 162) to (98, 63) then Places a green circle of radius 34 at center (358, 74) then Draws a yellow rectangle at (128, 125) with width 92 and height 110.
; PLAN: r0=249(x1), r1=162(y1), r2=98(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=74(y), r7=34(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x), r11=125(y), r12=92(width), r13=110(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 162
LDI r2, 98
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 74
LDI r7, 34
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 125
LDI r12, 92
LDI r13, 110
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
