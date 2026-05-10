; DESCRIPTION: Composite: Places a red 18x94 rectangle at position (195, 111) then Places a magenta dot at position (229, 9) then Places a yellow line segment connecting (278, 53) to (344, 95).
; PLAN: r0=195(x), r1=111(y), r2=18(width), r3=94(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=229(x), r6=9(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=278(x1), r11=53(y1), r12=344(x2), r13=95(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 195
LDI r1, 111
LDI r2, 18
LDI r3, 94
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 229
LDI r6, 9
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 278
LDI r11, 53
LDI r12, 344
LDI r13, 95
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
