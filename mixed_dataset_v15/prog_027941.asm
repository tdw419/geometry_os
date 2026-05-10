; DESCRIPTION: Composite: Sets a single black pixel at (274, 39) then Draws a red line from (106, 143) to (389, 145) then Draws a white rectangle at (225, 85) with width 99 and height 45.
; PLAN: r0=274(x), r1=39(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=106(x1), r6=143(y1), r7=389(x2), r8=145(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=85(y), r12=99(width), r13=45(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 39
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 106
LDI r6, 143
LDI r7, 389
LDI r8, 145
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 85
LDI r12, 99
LDI r13, 45
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
