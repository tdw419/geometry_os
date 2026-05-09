; DESCRIPTION: Composite: Places a blue dot at position (87, 206) then Places a orange line segment connecting (364, 44) to (227, 139) then Draws a green rectangle at (192, 138) with width 113 and height 21.
; PLAN: r0=87(x), r1=206(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=364(x1), r6=44(y1), r7=227(x2), r8=139(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=192(x), r11=138(y), r12=113(width), r13=21(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 206
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 364
LDI r6, 44
LDI r7, 227
LDI r8, 139
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 138
LDI r12, 113
LDI r13, 21
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
