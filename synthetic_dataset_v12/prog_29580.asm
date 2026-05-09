; DESCRIPTION: Composite: Draws a orange rectangle at (160, 49) with width 43 and height 67 then Places a purple dot at position (1, 231) then Renders a purple line between points (107, 222) and (449, 248).
; PLAN: r0=160(x), r1=49(y), r2=43(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=231(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=107(x1), r11=222(y1), r12=449(x2), r13=248(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 160
LDI r1, 49
LDI r2, 43
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 231
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 222
LDI r12, 449
LDI r13, 248
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
