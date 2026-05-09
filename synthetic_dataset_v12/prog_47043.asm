; DESCRIPTION: Composite: Draws a orange rectangle at (427, 91) with width 64 and height 37 then Places a purple dot at position (401, 203) then Draws a magenta line from (355, 141) to (382, 133).
; PLAN: r0=427(x), r1=91(y), r2=64(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=203(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=355(x1), r11=141(y1), r12=382(x2), r13=133(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 427
LDI r1, 91
LDI r2, 64
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 203
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 355
LDI r11, 141
LDI r12, 382
LDI r13, 133
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
