; DESCRIPTION: Composite: Draws a black line from (414, 133) to (490, 88) then Draws a white rectangle at (194, 104) with width 79 and height 48 then Sets a single green pixel at (42, 22).
; PLAN: r0=414(x1), r1=133(y1), r2=490(x2), r3=88(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=194(x), r6=104(y), r7=79(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x), r11=22(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 414
LDI r1, 133
LDI r2, 490
LDI r3, 88
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 104
LDI r7, 79
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 22
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
