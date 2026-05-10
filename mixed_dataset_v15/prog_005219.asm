; DESCRIPTION: Composite: Places a white dot at position (139, 193) then Places a black 34x118 rectangle at position (216, 50) then Places a green line segment connecting (200, 217) to (327, 235).
; PLAN: r0=139(x), r1=193(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=216(x), r6=50(y), r7=34(width), r8=118(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x1), r11=217(y1), r12=327(x2), r13=235(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 193
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 216
LDI r6, 50
LDI r7, 34
LDI r8, 118
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 217
LDI r12, 327
LDI r13, 235
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
