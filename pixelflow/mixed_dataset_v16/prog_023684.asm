; DESCRIPTION: Composite: Renders a purple line between points (194, 131) and (163, 87) then Places a purple 114x118 rectangle at position (143, 41) then Places a cyan dot at position (339, 151).
; PLAN: r0=194(x1), r1=131(y1), r2=163(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=41(y), r7=114(width), r8=118(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=339(x), r11=151(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 194
LDI r1, 131
LDI r2, 163
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 41
LDI r7, 114
LDI r8, 118
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 339
LDI r11, 151
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
