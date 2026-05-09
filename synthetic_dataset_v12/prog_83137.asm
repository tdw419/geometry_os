; DESCRIPTION: Composite: Places a black dot at position (308, 55) then Places a blue circle of radius 16 at center (188, 203) then Draws a purple line from (24, 106) to (371, 17).
; PLAN: r0=308(x), r1=55(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=188(x), r6=203(y), r7=16(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x1), r11=106(y1), r12=371(x2), r13=17(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 55
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 188
LDI r6, 203
LDI r7, 16
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 106
LDI r12, 371
LDI r13, 17
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
