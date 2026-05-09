; DESCRIPTION: Composite: Places a purple 65x113 rectangle at position (444, 46) then Places a purple dot at position (26, 113) then Draws a white line from (107, 94) to (208, 112).
; PLAN: r0=444(x), r1=46(y), r2=65(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=26(x), r6=113(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=107(x1), r11=94(y1), r12=208(x2), r13=112(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 46
LDI r2, 65
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 26
LDI r6, 113
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 107
LDI r11, 94
LDI r12, 208
LDI r13, 112
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
