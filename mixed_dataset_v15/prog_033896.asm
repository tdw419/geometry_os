; DESCRIPTION: Composite: Draws a red line from (125, 128) to (47, 58) then Places a purple circle of radius 71 at center (213, 114) then Draws a yellow rectangle at (179, 33) with width 116 and height 90.
; PLAN: r0=125(x1), r1=128(y1), r2=47(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=114(y), r7=71(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=33(y), r12=116(width), r13=90(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 128
LDI r2, 47
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 114
LDI r7, 71
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 33
LDI r12, 116
LDI r13, 90
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
