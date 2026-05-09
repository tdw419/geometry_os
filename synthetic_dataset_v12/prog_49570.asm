; DESCRIPTION: Composite: Places a red circle of radius 22 at center (30, 172) then Places a orange line segment connecting (22, 58) to (503, 250) then Places a yellow 74x109 rectangle at position (53, 138).
; PLAN: r0=30(x), r1=172(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x1), r6=58(y1), r7=503(x2), r8=250(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=53(x), r11=138(y), r12=74(width), r13=109(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 172
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 58
LDI r7, 503
LDI r8, 250
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 53
LDI r11, 138
LDI r12, 74
LDI r13, 109
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
