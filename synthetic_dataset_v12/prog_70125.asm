; DESCRIPTION: Composite: Places a purple dot at position (445, 43) then Places a blue 61x90 rectangle at position (186, 51) then Places a white line segment connecting (411, 53) to (156, 232).
; PLAN: r0=445(x), r1=43(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=51(y), r7=61(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x1), r11=53(y1), r12=156(x2), r13=232(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 43
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 51
LDI r7, 61
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 53
LDI r12, 156
LDI r13, 232
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
