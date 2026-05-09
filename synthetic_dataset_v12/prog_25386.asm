; DESCRIPTION: Composite: Renders a yellow line between points (171, 222) and (507, 140) then Places a white 60x118 rectangle at position (118, 78) then Sets a single blue pixel at (182, 115).
; PLAN: r0=171(x1), r1=222(y1), r2=507(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=118(x), r6=78(y), r7=60(width), r8=118(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x), r11=115(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 222
LDI r2, 507
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 118
LDI r6, 78
LDI r7, 60
LDI r8, 118
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 115
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
