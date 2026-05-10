; DESCRIPTION: Composite: Renders a orange line between points (29, 216) and (489, 138) then Places a green 86x80 rectangle at position (232, 128) then Places a white dot at position (325, 62).
; PLAN: r0=29(x1), r1=216(y1), r2=489(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=128(y), r7=86(width), r8=80(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=325(x), r11=62(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 29
LDI r1, 216
LDI r2, 489
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 128
LDI r7, 86
LDI r8, 80
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 62
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
