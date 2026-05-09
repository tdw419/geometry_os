; DESCRIPTION: Composite: Places a purple dot at position (112, 1) then Places a magenta line segment connecting (5, 70) to (244, 95) then Draws a purple rectangle at (255, 221) with width 30 and height 34.
; PLAN: r0=112(x), r1=1(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=5(x1), r6=70(y1), r7=244(x2), r8=95(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=255(x), r11=221(y), r12=30(width), r13=34(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 112
LDI r1, 1
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 5
LDI r6, 70
LDI r7, 244
LDI r8, 95
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 255
LDI r11, 221
LDI r12, 30
LDI r13, 34
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
