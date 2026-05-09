; DESCRIPTION: Composite: Draws a purple line from (511, 131) to (21, 91) then Places a orange 107x96 rectangle at position (279, 66) then Places a white dot at position (302, 116).
; PLAN: r0=511(x1), r1=131(y1), r2=21(x2), r3=91(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=66(y), r7=107(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=302(x), r11=116(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 511
LDI r1, 131
LDI r2, 21
LDI r3, 91
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 66
LDI r7, 107
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 116
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
