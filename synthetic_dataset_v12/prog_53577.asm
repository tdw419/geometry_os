; DESCRIPTION: Composite: Draws a green circle centered at (217, 82) with radius 79 then Draws a yellow line from (65, 236) to (104, 153) then Draws a blue rectangle at (98, 92) with width 79 and height 84.
; PLAN: r0=217(x), r1=82(y), r2=79(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=65(x1), r6=236(y1), r7=104(x2), r8=153(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=98(x), r11=92(y), r12=79(width), r13=84(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 82
LDI r2, 79
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 65
LDI r6, 236
LDI r7, 104
LDI r8, 153
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 92
LDI r12, 79
LDI r13, 84
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
