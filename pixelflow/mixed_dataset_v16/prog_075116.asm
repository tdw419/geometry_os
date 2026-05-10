; DESCRIPTION: Composite: Places a green circle of radius 20 at center (444, 114) then Renders a orange line between points (303, 147) and (433, 241) then Renders a black box of size 11x11 starting at (35, 188).
; PLAN: r0=444(x), r1=114(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=303(x1), r6=147(y1), r7=433(x2), r8=241(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=35(x), r11=188(y), r12=11(width), r13=11(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 114
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 303
LDI r6, 147
LDI r7, 433
LDI r8, 241
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 188
LDI r12, 11
LDI r13, 11
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
