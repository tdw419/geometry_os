; DESCRIPTION: Composite: Draws a white line from (445, 176) to (259, 208) then Draws a blue circle centered at (179, 51) with radius 37 then Creates a cyan rectangular region at (318, 167) spanning 97 by 53 pixels.
; PLAN: r0=445(x1), r1=176(y1), r2=259(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=51(y), r7=37(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=318(x), r11=167(y), r12=97(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 176
LDI r2, 259
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 51
LDI r7, 37
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 318
LDI r11, 167
LDI r12, 97
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
