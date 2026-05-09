; DESCRIPTION: Composite: Draws a blue rectangle at (309, 14) with width 84 and height 23 then Places a purple dot at position (23, 35) then Renders a orange line between points (115, 195) and (383, 86).
; PLAN: r0=309(x), r1=14(y), r2=84(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=35(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=115(x1), r11=195(y1), r12=383(x2), r13=86(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 14
LDI r2, 84
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 35
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 115
LDI r11, 195
LDI r12, 383
LDI r13, 86
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
