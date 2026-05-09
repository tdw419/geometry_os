; DESCRIPTION: Composite: Creates a black circular shape at (387, 101) with radius 54 then Renders a white line between points (372, 114) and (491, 122) then Places a magenta 90x53 rectangle at position (112, 112).
; PLAN: r0=387(x), r1=101(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x1), r6=114(y1), r7=491(x2), r8=122(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=112(x), r11=112(y), r12=90(width), r13=53(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 387
LDI r1, 101
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 114
LDI r7, 491
LDI r8, 122
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 112
LDI r11, 112
LDI r12, 90
LDI r13, 53
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
