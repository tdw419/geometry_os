; DESCRIPTION: Composite: Renders a white box of size 60x62 starting at (391, 12) then Renders a green line between points (206, 138) and (362, 93) then Places a purple circle of radius 43 at center (232, 51).
; PLAN: r0=391(x), r1=12(y), r2=60(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=206(x1), r6=138(y1), r7=362(x2), r8=93(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=51(y), r12=43(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 12
LDI r2, 60
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 138
LDI r7, 362
LDI r8, 93
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 51
LDI r12, 43
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
