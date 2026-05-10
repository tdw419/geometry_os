; DESCRIPTION: Composite: Renders a green line between points (163, 235) and (183, 204) then Places a black 65x115 rectangle at position (107, 94) then Places a purple dot at position (311, 96).
; PLAN: r0=163(x1), r1=235(y1), r2=183(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=107(x), r6=94(y), r7=65(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=311(x), r11=96(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 163
LDI r1, 235
LDI r2, 183
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 94
LDI r7, 65
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 96
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
