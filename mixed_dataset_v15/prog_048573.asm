; DESCRIPTION: Composite: Draws a magenta line from (67, 24) to (301, 253) then Places a red circle of radius 33 at center (408, 115) then Draws a red rectangle at (18, 109) with width 109 and height 66.
; PLAN: r0=67(x1), r1=24(y1), r2=301(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=115(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=18(x), r11=109(y), r12=109(width), r13=66(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 67
LDI r1, 24
LDI r2, 301
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 115
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 18
LDI r11, 109
LDI r12, 109
LDI r13, 66
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
