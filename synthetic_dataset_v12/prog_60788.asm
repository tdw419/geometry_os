; DESCRIPTION: Composite: Renders a yellow line between points (336, 72) and (417, 83) then Sets a single black pixel at (510, 179) then Draws a black rectangle at (322, 114) with width 43 and height 120.
; PLAN: r0=336(x1), r1=72(y1), r2=417(x2), r3=83(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=510(x), r6=179(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=114(y), r12=43(width), r13=120(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 72
LDI r2, 417
LDI r3, 83
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 510
LDI r6, 179
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 322
LDI r11, 114
LDI r12, 43
LDI r13, 120
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
