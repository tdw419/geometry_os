; DESCRIPTION: Composite: Draws a green rectangle at (47, 75) with width 64 and height 35 then Sets a single black pixel at (51, 135) then Draws a orange line from (2, 144) to (292, 54).
; PLAN: r0=47(x), r1=75(y), r2=64(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=51(x), r6=135(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=2(x1), r11=144(y1), r12=292(x2), r13=54(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 47
LDI r1, 75
LDI r2, 64
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 135
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 2
LDI r11, 144
LDI r12, 292
LDI r13, 54
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
