; DESCRIPTION: Composite: Places a purple dot at position (76, 239) then Places a purple 114x53 rectangle at position (26, 200) then Places a orange line segment connecting (229, 10) to (74, 249).
; PLAN: r0=76(x), r1=239(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=26(x), r6=200(y), r7=114(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x1), r11=10(y1), r12=74(x2), r13=249(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 239
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 26
LDI r6, 200
LDI r7, 114
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 10
LDI r12, 74
LDI r13, 249
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
