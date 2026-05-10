; DESCRIPTION: Composite: Draws a green circle centered at (409, 99) with radius 41 then Draws a white rectangle at (122, 173) with width 39 and height 80 then Renders a green line between points (365, 199) and (179, 9).
; PLAN: r0=409(x), r1=99(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=173(y), r7=39(width), r8=80(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x1), r11=199(y1), r12=179(x2), r13=9(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 99
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 173
LDI r7, 39
LDI r8, 80
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 199
LDI r12, 179
LDI r13, 9
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
