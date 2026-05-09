; DESCRIPTION: Composite: Draws a red circle centered at (124, 141) with radius 79 then Draws a cyan rectangle at (283, 98) with width 76 and height 70 then Renders a yellow line between points (452, 164) and (476, 145).
; PLAN: r0=124(x), r1=141(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=98(y), r7=76(width), r8=70(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x1), r11=164(y1), r12=476(x2), r13=145(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 124
LDI r1, 141
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 98
LDI r7, 76
LDI r8, 70
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 164
LDI r12, 476
LDI r13, 145
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
