; DESCRIPTION: Composite: Renders a blue line between points (433, 104) and (209, 31) then Creates a white rectangular region at (265, 94) spanning 80 by 45 pixels then Places a orange dot at position (451, 158).
; PLAN: r0=433(x1), r1=104(y1), r2=209(x2), r3=31(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=94(y), r7=80(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=451(x), r11=158(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 433
LDI r1, 104
LDI r2, 209
LDI r3, 31
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 94
LDI r7, 80
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 451
LDI r11, 158
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
