; DESCRIPTION: Composite: Draws a white line from (346, 156) to (492, 52) then Places a white 108x67 rectangle at position (311, 55) then Sets a single purple pixel at (484, 11).
; PLAN: r0=346(x1), r1=156(y1), r2=492(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=55(y), r7=108(width), r8=67(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x), r11=11(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 346
LDI r1, 156
LDI r2, 492
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 55
LDI r7, 108
LDI r8, 67
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 11
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
