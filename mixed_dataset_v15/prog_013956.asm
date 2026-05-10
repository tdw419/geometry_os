; DESCRIPTION: Composite: Places a cyan 52x119 rectangle at position (451, 134) then Places a orange dot at position (156, 192) then Draws a blue line from (93, 63) to (213, 175).
; PLAN: r0=451(x), r1=134(y), r2=52(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=156(x), r6=192(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=93(x1), r11=63(y1), r12=213(x2), r13=175(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 134
LDI r2, 52
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 192
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 93
LDI r11, 63
LDI r12, 213
LDI r13, 175
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
