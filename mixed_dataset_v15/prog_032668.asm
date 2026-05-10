; DESCRIPTION: Composite: Places a orange line segment connecting (89, 68) to (390, 172) then Sets a single white pixel at (488, 40) then Places a black 46x38 rectangle at position (74, 80).
; PLAN: r0=89(x1), r1=68(y1), r2=390(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=488(x), r6=40(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=74(x), r11=80(y), r12=46(width), r13=38(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 68
LDI r2, 390
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 40
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 74
LDI r11, 80
LDI r12, 46
LDI r13, 38
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
