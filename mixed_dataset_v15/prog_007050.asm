; DESCRIPTION: Composite: Draws a blue rectangle at (173, 31) with width 97 and height 39 then Renders a purple line between points (72, 251) and (123, 217) then Places a orange circle of radius 51 at center (346, 174).
; PLAN: r0=173(x), r1=31(y), r2=97(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x1), r6=251(y1), r7=123(x2), r8=217(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=346(x), r11=174(y), r12=51(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 173
LDI r1, 31
LDI r2, 97
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 251
LDI r7, 123
LDI r8, 217
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 346
LDI r11, 174
LDI r12, 51
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
