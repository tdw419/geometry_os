; DESCRIPTION: Composite: Creates a magenta rectangular region at (251, 118) spanning 26 by 36 pixels then Places a black dot at position (155, 171) then Places a red line segment connecting (493, 104) to (52, 128).
; PLAN: r0=251(x), r1=118(y), r2=26(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=171(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=493(x1), r11=104(y1), r12=52(x2), r13=128(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 251
LDI r1, 118
LDI r2, 26
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 171
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 493
LDI r11, 104
LDI r12, 52
LDI r13, 128
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
