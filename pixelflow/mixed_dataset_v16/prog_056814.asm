; DESCRIPTION: Composite: Places a red 26x31 rectangle at position (122, 131) then Places a white line segment connecting (419, 175) to (323, 145) then Sets a single black pixel at (437, 83).
; PLAN: r0=122(x), r1=131(y), r2=26(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x1), r6=175(y1), r7=323(x2), r8=145(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=437(x), r11=83(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 131
LDI r2, 26
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 175
LDI r7, 323
LDI r8, 145
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 437
LDI r11, 83
LDI r12, 0x000000
PSET r10, r11, r12
HALT
