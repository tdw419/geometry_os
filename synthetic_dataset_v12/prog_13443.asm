; DESCRIPTION: Composite: Renders a orange disk with center (87, 153) and radius 11 then Draws a white rectangle at (253, 102) with width 105 and height 71 then Places a blue line segment connecting (418, 206) to (68, 231).
; PLAN: r0=87(x), r1=153(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=253(x), r6=102(y), r7=105(width), r8=71(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=418(x1), r11=206(y1), r12=68(x2), r13=231(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 87
LDI r1, 153
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 253
LDI r6, 102
LDI r7, 105
LDI r8, 71
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 418
LDI r11, 206
LDI r12, 68
LDI r13, 231
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
