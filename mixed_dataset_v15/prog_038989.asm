; DESCRIPTION: Composite: Sets a single purple pixel at (508, 134) then Places a white line segment connecting (232, 95) to (179, 124) then Places a magenta 31x113 rectangle at position (351, 61).
; PLAN: r0=508(x), r1=134(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=232(x1), r6=95(y1), r7=179(x2), r8=124(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=61(y), r12=31(width), r13=113(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 508
LDI r1, 134
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 232
LDI r6, 95
LDI r7, 179
LDI r8, 124
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 61
LDI r12, 31
LDI r13, 113
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
