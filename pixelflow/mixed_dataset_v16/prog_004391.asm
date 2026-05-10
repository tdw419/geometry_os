; DESCRIPTION: Composite: Draws a red line from (324, 156) to (492, 75) then Places a purple dot at position (75, 223) then Draws a cyan rectangle at (402, 76) with width 109 and height 75.
; PLAN: r0=324(x1), r1=156(y1), r2=492(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=402(x), r11=76(y), r12=109(width), r13=75(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 324
LDI r1, 156
LDI r2, 492
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 402
LDI r11, 76
LDI r12, 109
LDI r13, 75
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
