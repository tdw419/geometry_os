; DESCRIPTION: Composite: Draws a cyan rectangle at (38, 159) with width 98 and height 85 then Places a purple dot at position (288, 60) then Draws a red line from (350, 30) to (312, 237).
; PLAN: r0=38(x), r1=159(y), r2=98(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=60(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=350(x1), r11=30(y1), r12=312(x2), r13=237(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 159
LDI r2, 98
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 60
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 350
LDI r11, 30
LDI r12, 312
LDI r13, 237
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
