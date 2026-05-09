; DESCRIPTION: Composite: Places a purple 116x55 rectangle at position (230, 113) then Draws a white circle centered at (204, 156) with radius 23 then Renders a cyan line between points (427, 173) and (506, 37).
; PLAN: r0=230(x), r1=113(y), r2=116(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=156(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x1), r11=173(y1), r12=506(x2), r13=37(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 113
LDI r2, 116
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 156
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 173
LDI r12, 506
LDI r13, 37
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
