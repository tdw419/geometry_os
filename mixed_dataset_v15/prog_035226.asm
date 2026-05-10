; DESCRIPTION: Composite: Places a magenta dot at position (338, 35) then Creates a magenta rectangular region at (370, 186) spanning 17 by 32 pixels then Draws a black line from (95, 70) to (89, 100).
; PLAN: r0=338(x), r1=35(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=370(x), r6=186(y), r7=17(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=95(x1), r11=70(y1), r12=89(x2), r13=100(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 35
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 186
LDI r7, 17
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 95
LDI r11, 70
LDI r12, 89
LDI r13, 100
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
