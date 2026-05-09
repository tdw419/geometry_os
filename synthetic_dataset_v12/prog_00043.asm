; DESCRIPTION: Composite: Sets a single green pixel at (74, 220) then Places a yellow line segment connecting (351, 198) to (56, 141) then Places a black 74x74 rectangle at position (113, 75).
; PLAN: r0=74(x), r1=220(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=351(x1), r6=198(y1), r7=56(x2), r8=141(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=75(y), r12=74(width), r13=74(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 220
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 351
LDI r6, 198
LDI r7, 56
LDI r8, 141
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 75
LDI r12, 74
LDI r13, 74
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
