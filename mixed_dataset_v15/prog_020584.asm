; DESCRIPTION: Composite: Places a white circle of radius 54 at center (389, 97) then Draws a cyan rectangle at (157, 9) with width 116 and height 53 then Renders a purple line between points (378, 58) and (315, 142).
; PLAN: r0=389(x), r1=97(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=157(x), r6=9(y), r7=116(width), r8=53(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x1), r11=58(y1), r12=315(x2), r13=142(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 389
LDI r1, 97
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 157
LDI r6, 9
LDI r7, 116
LDI r8, 53
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 58
LDI r12, 315
LDI r13, 142
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
