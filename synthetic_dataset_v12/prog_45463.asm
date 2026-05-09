; DESCRIPTION: Composite: Draws a black rectangle at (166, 42) with width 70 and height 95 then Sets a single orange pixel at (504, 66) then Draws a purple line from (229, 194) to (338, 105).
; PLAN: r0=166(x), r1=42(y), r2=70(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=504(x), r6=66(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=229(x1), r11=194(y1), r12=338(x2), r13=105(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 166
LDI r1, 42
LDI r2, 70
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 504
LDI r6, 66
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 229
LDI r11, 194
LDI r12, 338
LDI r13, 105
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
