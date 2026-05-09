; DESCRIPTION: Composite: Places a black 88x58 rectangle at position (151, 20) then Places a white line segment connecting (74, 154) to (437, 19) then Places a white circle of radius 73 at center (408, 134).
; PLAN: r0=151(x), r1=20(y), r2=88(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=154(y1), r7=437(x2), r8=19(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=408(x), r11=134(y), r12=73(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 20
LDI r2, 88
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 154
LDI r7, 437
LDI r8, 19
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 134
LDI r12, 73
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
