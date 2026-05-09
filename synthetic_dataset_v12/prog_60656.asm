; DESCRIPTION: Composite: Renders a red line between points (22, 212) and (444, 75) then Places a orange dot at position (316, 15) then Renders a cyan box of size 115x53 starting at (64, 161).
; PLAN: r0=22(x1), r1=212(y1), r2=444(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=15(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=64(x), r11=161(y), r12=115(width), r13=53(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 22
LDI r1, 212
LDI r2, 444
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 15
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 64
LDI r11, 161
LDI r12, 115
LDI r13, 53
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
