; DESCRIPTION: Composite: Draws a orange line from (440, 68) to (149, 134) then Draws a black rectangle at (25, 87) with width 44 and height 61 then Places a yellow dot at position (229, 43).
; PLAN: r0=440(x1), r1=68(y1), r2=149(x2), r3=134(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=87(y), r7=44(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=229(x), r11=43(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 68
LDI r2, 149
LDI r3, 134
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 87
LDI r7, 44
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 43
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
