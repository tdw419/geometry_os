; DESCRIPTION: Composite: Draws a black line from (330, 195) to (35, 127) then Places a cyan 113x16 rectangle at position (358, 84) then Creates a red circular shape at (285, 101) with radius 75.
; PLAN: r0=330(x1), r1=195(y1), r2=35(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=358(x), r6=84(y), r7=113(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=285(x), r11=101(y), r12=75(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 330
LDI r1, 195
LDI r2, 35
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 358
LDI r6, 84
LDI r7, 113
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 285
LDI r11, 101
LDI r12, 75
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
