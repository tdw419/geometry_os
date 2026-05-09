; DESCRIPTION: Composite: Renders a yellow line between points (287, 20) and (268, 233) then Renders a yellow disk with center (317, 194) and radius 44 then Draws a yellow rectangle at (288, 203) with width 61 and height 17.
; PLAN: r0=287(x1), r1=20(y1), r2=268(x2), r3=233(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=194(y), r7=44(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=288(x), r11=203(y), r12=61(width), r13=17(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 20
LDI r2, 268
LDI r3, 233
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 194
LDI r7, 44
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 288
LDI r11, 203
LDI r12, 61
LDI r13, 17
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
