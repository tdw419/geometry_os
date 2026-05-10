; DESCRIPTION: Composite: Draws a blue line from (141, 254) to (155, 166) then Places a red dot at position (216, 17) then Places a black 44x11 rectangle at position (106, 78).
; PLAN: r0=141(x1), r1=254(y1), r2=155(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=216(x), r6=17(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=106(x), r11=78(y), r12=44(width), r13=11(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 141
LDI r1, 254
LDI r2, 155
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 216
LDI r6, 17
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 106
LDI r11, 78
LDI r12, 44
LDI r13, 11
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
