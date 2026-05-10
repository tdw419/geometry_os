; DESCRIPTION: Composite: Draws a red line from (43, 118) to (13, 202) then Places a green dot at position (212, 121) then Draws a white circle centered at (352, 79) with radius 50.
; PLAN: r0=43(x1), r1=118(y1), r2=13(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=121(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=352(x), r11=79(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 43
LDI r1, 118
LDI r2, 13
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 121
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 352
LDI r11, 79
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
