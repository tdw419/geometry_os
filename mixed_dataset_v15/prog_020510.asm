; DESCRIPTION: Composite: Draws a orange line from (388, 36) to (246, 74) then Sets a single cyan pixel at (166, 34) then Draws a purple rectangle at (277, 124) with width 75 and height 114.
; PLAN: r0=388(x1), r1=36(y1), r2=246(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=34(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=277(x), r11=124(y), r12=75(width), r13=114(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 388
LDI r1, 36
LDI r2, 246
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 34
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 277
LDI r11, 124
LDI r12, 75
LDI r13, 114
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
