; DESCRIPTION: Composite: Draws a purple line from (505, 156) to (0, 149) then Places a white 19x70 rectangle at position (122, 172) then Sets a single magenta pixel at (168, 198).
; PLAN: r0=505(x1), r1=156(y1), r2=0(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=172(y), r7=19(width), r8=70(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=168(x), r11=198(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 505
LDI r1, 156
LDI r2, 0
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 172
LDI r7, 19
LDI r8, 70
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 198
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
