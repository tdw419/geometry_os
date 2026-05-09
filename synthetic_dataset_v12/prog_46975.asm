; DESCRIPTION: Composite: Draws a magenta rectangle at (302, 58) with width 116 and height 43 then Places a black dot at position (340, 242) then Renders a yellow line between points (471, 93) and (484, 251).
; PLAN: r0=302(x), r1=58(y), r2=116(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x), r6=242(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=471(x1), r11=93(y1), r12=484(x2), r13=251(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 302
LDI r1, 58
LDI r2, 116
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 242
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 471
LDI r11, 93
LDI r12, 484
LDI r13, 251
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
