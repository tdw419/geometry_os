; DESCRIPTION: Composite: Draws a red line from (91, 16) to (496, 207) then Creates a blue rectangular region at (49, 51) spanning 28 by 26 pixels then Places a red dot at position (281, 202).
; PLAN: r0=91(x1), r1=16(y1), r2=496(x2), r3=207(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=51(y), r7=28(width), r8=26(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=281(x), r11=202(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 16
LDI r2, 496
LDI r3, 207
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 51
LDI r7, 28
LDI r8, 26
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 202
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
