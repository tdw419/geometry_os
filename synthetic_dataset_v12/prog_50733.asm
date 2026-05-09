; DESCRIPTION: Composite: Draws a blue circle centered at (345, 188) with radius 65 then Draws a yellow rectangle at (437, 79) with width 28 and height 107 then Draws a white line from (331, 165) to (259, 30).
; PLAN: r0=345(x), r1=188(y), r2=65(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x), r6=79(y), r7=28(width), r8=107(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=331(x1), r11=165(y1), r12=259(x2), r13=30(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 188
LDI r2, 65
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 79
LDI r7, 28
LDI r8, 107
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 331
LDI r11, 165
LDI r12, 259
LDI r13, 30
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
