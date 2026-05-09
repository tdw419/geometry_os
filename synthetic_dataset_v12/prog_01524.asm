; DESCRIPTION: Composite: Draws a orange line from (130, 164) to (238, 2) then Sets a single red pixel at (301, 7) then Draws a magenta rectangle at (222, 20) with width 16 and height 96.
; PLAN: r0=130(x1), r1=164(y1), r2=238(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=222(x), r11=20(y), r12=16(width), r13=96(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 164
LDI r2, 238
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 222
LDI r11, 20
LDI r12, 16
LDI r13, 96
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
