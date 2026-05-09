; DESCRIPTION: Composite: Places a purple 59x105 rectangle at position (278, 24) then Places a purple circle of radius 47 at center (187, 100) then Draws a red line from (284, 169) to (125, 52).
; PLAN: r0=278(x), r1=24(y), r2=59(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=187(x), r6=100(y), r7=47(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x1), r11=169(y1), r12=125(x2), r13=52(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 24
LDI r2, 59
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 100
LDI r7, 47
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 169
LDI r12, 125
LDI r13, 52
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
