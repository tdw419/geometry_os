; DESCRIPTION: Composite: Draws a white circle centered at (74, 170) with radius 70 then Draws a red line from (197, 46) to (291, 109) then Places a magenta 17x41 rectangle at position (483, 117).
; PLAN: r0=74(x), r1=170(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=197(x1), r6=46(y1), r7=291(x2), r8=109(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=483(x), r11=117(y), r12=17(width), r13=41(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 170
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 197
LDI r6, 46
LDI r7, 291
LDI r8, 109
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 483
LDI r11, 117
LDI r12, 17
LDI r13, 41
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
