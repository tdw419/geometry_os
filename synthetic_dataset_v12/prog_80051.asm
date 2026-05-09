; DESCRIPTION: Composite: Draws a orange rectangle at (118, 101) with width 88 and height 14 then Places a white dot at position (141, 161) then Draws a orange line from (252, 213) to (494, 207).
; PLAN: r0=118(x), r1=101(y), r2=88(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=252(x1), r11=213(y1), r12=494(x2), r13=207(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 118
LDI r1, 101
LDI r2, 88
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 252
LDI r11, 213
LDI r12, 494
LDI r13, 207
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
