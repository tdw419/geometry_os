; DESCRIPTION: Composite: Sets a single yellow pixel at (164, 67) then Draws a purple rectangle at (41, 15) with width 59 and height 32 then Draws a red line from (143, 155) to (222, 221).
; PLAN: r0=164(x), r1=67(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=15(y), r7=59(width), r8=32(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=143(x1), r11=155(y1), r12=222(x2), r13=221(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 164
LDI r1, 67
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 41
LDI r6, 15
LDI r7, 59
LDI r8, 32
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 143
LDI r11, 155
LDI r12, 222
LDI r13, 221
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
