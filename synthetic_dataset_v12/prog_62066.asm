; DESCRIPTION: Composite: Creates a green circular shape at (417, 197) with radius 49 then Places a black 74x89 rectangle at position (309, 112) then Places a yellow line segment connecting (162, 232) to (94, 216).
; PLAN: r0=417(x), r1=197(y), r2=49(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=309(x), r6=112(y), r7=74(width), r8=89(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=232(y1), r12=94(x2), r13=216(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 417
LDI r1, 197
LDI r2, 49
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 309
LDI r6, 112
LDI r7, 74
LDI r8, 89
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 232
LDI r12, 94
LDI r13, 216
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
