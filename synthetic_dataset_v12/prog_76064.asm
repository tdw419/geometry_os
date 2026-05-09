; DESCRIPTION: Composite: Draws a cyan rectangle at (47, 115) with width 103 and height 35 then Places a green dot at position (434, 234) then Draws a orange line from (505, 16) to (316, 11).
; PLAN: r0=47(x), r1=115(y), r2=103(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=234(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=505(x1), r11=16(y1), r12=316(x2), r13=11(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 115
LDI r2, 103
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 234
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 505
LDI r11, 16
LDI r12, 316
LDI r13, 11
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
