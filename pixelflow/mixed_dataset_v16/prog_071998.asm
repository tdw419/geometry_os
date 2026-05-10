; DESCRIPTION: Composite: Draws a black rectangle at (43, 65) with width 98 and height 110 then Places a black dot at position (114, 194) then Places a black line segment connecting (372, 69) to (230, 135).
; PLAN: r0=43(x), r1=65(y), r2=98(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=114(x), r6=194(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=372(x1), r11=69(y1), r12=230(x2), r13=135(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 43
LDI r1, 65
LDI r2, 98
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 114
LDI r6, 194
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 372
LDI r11, 69
LDI r12, 230
LDI r13, 135
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
