; DESCRIPTION: Composite: Places a orange line segment connecting (153, 143) to (295, 53) then Sets a single magenta pixel at (477, 77) then Places a orange 26x58 rectangle at position (473, 181).
; PLAN: r0=153(x1), r1=143(y1), r2=295(x2), r3=53(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=477(x), r6=77(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=473(x), r11=181(y), r12=26(width), r13=58(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 143
LDI r2, 295
LDI r3, 53
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 477
LDI r6, 77
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 473
LDI r11, 181
LDI r12, 26
LDI r13, 58
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
