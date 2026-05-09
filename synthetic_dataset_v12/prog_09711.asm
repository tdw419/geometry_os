; DESCRIPTION: Composite: Draws a white rectangle at (357, 96) with width 18 and height 31 then Sets a single blue pixel at (72, 236) then Draws a orange line from (283, 39) to (250, 31).
; PLAN: r0=357(x), r1=96(y), r2=18(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=236(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=283(x1), r11=39(y1), r12=250(x2), r13=31(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 96
LDI r2, 18
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 236
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 283
LDI r11, 39
LDI r12, 250
LDI r13, 31
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
