; DESCRIPTION: Composite: Renders a blue line between points (107, 141) and (367, 157) then Sets a single blue pixel at (115, 185) then Draws a black rectangle at (19, 134) with width 36 and height 90.
; PLAN: r0=107(x1), r1=141(y1), r2=367(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=115(x), r6=185(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=19(x), r11=134(y), r12=36(width), r13=90(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 141
LDI r2, 367
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 115
LDI r6, 185
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 19
LDI r11, 134
LDI r12, 36
LDI r13, 90
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
