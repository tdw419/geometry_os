; DESCRIPTION: Composite: Draws a orange line from (295, 139) to (451, 21) then Places a purple 86x109 rectangle at position (244, 95) then Places a blue dot at position (368, 143).
; PLAN: r0=295(x1), r1=139(y1), r2=451(x2), r3=21(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=95(y), r7=86(width), r8=109(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=368(x), r11=143(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 295
LDI r1, 139
LDI r2, 451
LDI r3, 21
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 95
LDI r7, 86
LDI r8, 109
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 143
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
