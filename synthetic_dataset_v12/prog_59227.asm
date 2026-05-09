; DESCRIPTION: Composite: Renders a magenta line between points (169, 137) and (22, 140) then Places a magenta dot at position (145, 17) then Draws a cyan rectangle at (159, 195) with width 55 and height 41.
; PLAN: r0=169(x1), r1=137(y1), r2=22(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=17(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=159(x), r11=195(y), r12=55(width), r13=41(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 137
LDI r2, 22
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 17
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 159
LDI r11, 195
LDI r12, 55
LDI r13, 41
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
