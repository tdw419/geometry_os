; DESCRIPTION: Composite: Sets a single magenta pixel at (238, 81) then Places a yellow 50x84 rectangle at position (195, 88) then Draws a orange line from (107, 159) to (232, 75).
; PLAN: r0=238(x), r1=81(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=88(y), r7=50(width), r8=84(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=107(x1), r11=159(y1), r12=232(x2), r13=75(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 238
LDI r1, 81
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 195
LDI r6, 88
LDI r7, 50
LDI r8, 84
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 107
LDI r11, 159
LDI r12, 232
LDI r13, 75
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
