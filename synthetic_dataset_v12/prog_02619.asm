; DESCRIPTION: Composite: Draws a purple line from (222, 136) to (480, 86) then Draws a red rectangle at (336, 143) with width 95 and height 98 then Places a black dot at position (350, 70).
; PLAN: r0=222(x1), r1=136(y1), r2=480(x2), r3=86(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=143(y), r7=95(width), r8=98(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=350(x), r11=70(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 222
LDI r1, 136
LDI r2, 480
LDI r3, 86
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 143
LDI r7, 95
LDI r8, 98
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 70
LDI r12, 0x000000
PSET r10, r11, r12
HALT
