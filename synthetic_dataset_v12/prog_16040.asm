; DESCRIPTION: Composite: Sets a single magenta pixel at (93, 15) then Places a magenta line segment connecting (114, 70) to (234, 114) then Draws a white rectangle at (476, 175) with width 25 and height 72.
; PLAN: r0=93(x), r1=15(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=70(y1), r7=234(x2), r8=114(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=175(y), r12=25(width), r13=72(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 15
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 114
LDI r6, 70
LDI r7, 234
LDI r8, 114
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 175
LDI r12, 25
LDI r13, 72
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
