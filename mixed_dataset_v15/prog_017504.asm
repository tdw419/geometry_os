; DESCRIPTION: Composite: Renders a green box of size 14x94 starting at (396, 51) then Places a red dot at position (353, 118) then Places a red line segment connecting (206, 47) to (211, 5).
; PLAN: r0=396(x), r1=51(y), r2=14(width), r3=94(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=353(x), r6=118(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=206(x1), r11=47(y1), r12=211(x2), r13=5(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 51
LDI r2, 14
LDI r3, 94
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 118
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 206
LDI r11, 47
LDI r12, 211
LDI r13, 5
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
