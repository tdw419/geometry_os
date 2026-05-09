; DESCRIPTION: Composite: Draws a orange line from (300, 206) to (212, 173) then Renders a red box of size 26x110 starting at (160, 145) then Sets a single black pixel at (486, 73).
; PLAN: r0=300(x1), r1=206(y1), r2=212(x2), r3=173(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=145(y), r7=26(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=486(x), r11=73(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 300
LDI r1, 206
LDI r2, 212
LDI r3, 173
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 145
LDI r7, 26
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 486
LDI r11, 73
LDI r12, 0x000000
PSET r10, r11, r12
HALT
