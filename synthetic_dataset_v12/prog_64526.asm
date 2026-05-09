; DESCRIPTION: Composite: Places a cyan line segment connecting (477, 236) to (225, 62) then Draws a white rectangle at (114, 22) with width 55 and height 71 then Draws a yellow circle centered at (273, 133) with radius 73.
; PLAN: r0=477(x1), r1=236(y1), r2=225(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=114(x), r6=22(y), r7=55(width), r8=71(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=133(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 477
LDI r1, 236
LDI r2, 225
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 22
LDI r7, 55
LDI r8, 71
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 133
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
