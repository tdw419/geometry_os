; DESCRIPTION: Composite: Renders a magenta line between points (507, 202) and (270, 142) then Places a orange dot at position (476, 58) then Renders a yellow box of size 106x78 starting at (266, 108).
; PLAN: r0=507(x1), r1=202(y1), r2=270(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=476(x), r6=58(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=108(y), r12=106(width), r13=78(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 507
LDI r1, 202
LDI r2, 270
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 476
LDI r6, 58
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 266
LDI r11, 108
LDI r12, 106
LDI r13, 78
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
