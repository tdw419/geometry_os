; DESCRIPTION: Composite: Renders a orange disk with center (132, 60) and radius 60 then Places a red line segment connecting (255, 152) to (358, 244) then Draws a cyan rectangle at (310, 193) with width 26 and height 58.
; PLAN: r0=132(x), r1=60(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x1), r6=152(y1), r7=358(x2), r8=244(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=193(y), r12=26(width), r13=58(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 132
LDI r1, 60
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 152
LDI r7, 358
LDI r8, 244
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 193
LDI r12, 26
LDI r13, 58
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
