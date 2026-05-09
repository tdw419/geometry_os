; DESCRIPTION: Composite: Draws a black rectangle at (177, 73) with width 84 and height 106 then Sets a single yellow pixel at (245, 38) then Draws a orange line from (93, 164) to (217, 64).
; PLAN: r0=177(x), r1=73(y), r2=84(width), r3=106(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=38(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=93(x1), r11=164(y1), r12=217(x2), r13=64(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 73
LDI r2, 84
LDI r3, 106
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 38
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 93
LDI r11, 164
LDI r12, 217
LDI r13, 64
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
