; DESCRIPTION: Composite: Draws a purple rectangle at (472, 142) with width 19 and height 46 then Places a black dot at position (88, 150) then Renders a cyan line between points (265, 161) and (122, 254).
; PLAN: r0=472(x), r1=142(y), r2=19(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x), r6=150(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=265(x1), r11=161(y1), r12=122(x2), r13=254(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 472
LDI r1, 142
LDI r2, 19
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 150
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 265
LDI r11, 161
LDI r12, 122
LDI r13, 254
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
